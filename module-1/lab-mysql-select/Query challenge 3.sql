select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", sum(s.qty) as "TOTAL"
from authors a
inner join titleauthor ta
on a.au_id = ta.au_id
inner join sales s
on ta.title_id = s.title_id
group by a.au_id
order by TOTAL DESC LIMIT 3;






