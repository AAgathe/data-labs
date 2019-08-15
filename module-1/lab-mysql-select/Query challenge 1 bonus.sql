select AUTHOR_ID, LAST_NAME, FIRST_NAME, ((PRICE*TOTAL*ROYALTY*ROYALTYPER) + (ADVANCE*ROYALTYPER)) as PROFIT
from(
select a.au_id as AUTHOR_ID, a.au_lname as LAST_NAME, a.au_fname as FIRST_NAME, COALESCE(sum(s.qty),0) as TOTAL, t.price as PRICE, ta.title_id as TITLE_ID, t.advance as ADVANCE, 
(ta.royaltyper/100) as ROYALTYPER, (t.royalty/100) as ROYALTY
from authors a
left join titleauthor ta
on a.au_id = ta.au_id
left join sales s
on ta.title_id = s.title_id
left join titles t
on ta.title_id = t.title_id
group by a.au_id, ta.title_id
) new
order by PROFIT DESC LIMIT 3;
