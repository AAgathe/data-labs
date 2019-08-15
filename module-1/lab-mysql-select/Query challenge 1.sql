select a.au_id as "AUTHOR ID", a.au_lname as "LAST NAME", a.au_fname as "FIRST NAME", t.title as TITLE, p.pub_name as PUBLISHER
from authors a
inner join titleauthor ta
on a.au_id = ta.au_id
inner join titles t
on ta.title_id = t.title_id
inner join publishers p
on t.pub_id = p.pub_id;

