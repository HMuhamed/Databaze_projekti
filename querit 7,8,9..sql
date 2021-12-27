select l.Emri as "Emri",l.Mbiemri as "Mbiemri",count(hz.lid) as "Numri i librave te huazuar",li.Zhanri as "Zhanri i Preferuar", hz.verejte as "Verejtje" from lexuesi l join huazimi_librit hz on l.leid=hz.leid 
join libri li on hz.lid=li.lid WHERE YEAR(Dataehuazimit) = 2021 group by hz.leid;


SELECT
  l.Titulli AS `Libri_me_i_lexuar`,
  a.Emri as 'Autori',
  COUNT(l.Lid) AS `Huazuar`
FROM
  huazimi_librit hl join libri l on hl.Lid=l.Lid
  join autorët a on hl.Aid=a.aid
  where hl.Dataekthimit<='2021-12-31'
GROUP BY l.Lid ORDER BY 
  `Huazuar` DESC LIMIT 1;
  
  
  
  SELECT a.Emri as 'Emri',a.Mbiemri as "Mbiemri",count(a.aid) as "Autori_me_i_lexuar"
FROM autorët a join huazimi_librit hz on a.aid=hz.aid GROUP BY a.aid ORDER BY 
  `Autori_me_i_lexuar` DESC LIMIT 1;
  
  