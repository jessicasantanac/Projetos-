
create database Loja;
use Loja;

create table tbl_vendas( 
ID_Nf smallint not null,
ID_Item smallint  not null,
Cod_Produto smallint not null,
Valor_unit float not null,
Quantidade int not null,
Desconto int null );

insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto) 
 values('1','1','1','25.00','10','5');
 
 insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
 values ('1','2','2','13.50','3',null);
 
insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('1','3','3','15.00','2',null);

insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('1','4','4','10.00','1',null);

 insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
 values ('1','5','5','30.00','1',null);
 
 insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
 values ('2','1','3','15.00','4',null);
 
insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values('2','2','4','10.00','5',null);

 insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
 values ('2','3','5','30.00','7',null);
 
insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
  values('3','1','1','25.00','5',null);
  
insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
   values ('3','2','4','10.00','4',null);
   
insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
    values ('3','3','5','30.00','5',null);
    
insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('3','4','2','13.50','7',null);

insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('4','1','5','30.00','10','15');

insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('4','2','4','10.00','12','5');

insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('4','3','1','25.00','13','5');

insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('4','4','2','13.50','15','5');

insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('5','1','3','15.00','3',null);

insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
  values ('5','2','5','30.00','6',null);
  
  insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('6','1','1','25.00','22','15');

insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('6','2','3','15.00','25','20');

insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('7','1','1','25.00','10','3');

insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('7','2','2','13.50','10','4');

insert into tbl_vendas(ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('7','3','3','15.00','10','4');

insert into tbl_vendas (ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,Desconto)
values ('7','4','5','30.00','10','1');

-- exercicio a
Select ID_Nf, ID_Item, Cod_Produto, Valor_unit from tbl_vendas
 where Desconto is null;
 
 -- exercicio b
 Select  ID_Nf, ID_Item, Cod_Produto, Valor_unit,
Valor_unit - (Valor_unit * (Desconto/100)) as 'Valor Vendido'
from tbl_vendas
where Desconto is not null order by Valor_unit;

-- exercicio c
Update tbl_vendas set Desconto=0
where Desconto is null;

select* from tbl_vendas;

--  exercicio d 
Select  ID_Nf,ID_Item,Cod_Produto,Valor_unit,Quantidade,
Quantidade*Valor_unit-Valor_unit*(Desconto/100) as 'Valor_total',
 Desconto,  
 Valor_unit-(Valor_unit*(Desconto/100)) as 'Valor_vendido'
FROM tbl_vendas where Desconto is not null;

-- exercicio e 
Select ID_Nf,sum(Quantidade*Valor_unit) as Valor_total
from tbl_vendas
group by ID_Nf order by Valor_total desc;


-- exercicio f
 select ID_Nf,sum(Valor_unit - Valor_unit*Desconto/100) as 
 Valor_vendido, sum(Quantidade * Valor_unit) as Valor_total
from tbl_vendas group by ID_Nf order by Valor_vendido desc;

-- exercicio g
select Cod_produto, sum(Quantidade) as total
from tbl_vendas
group by Cod_produto
order by total desc limit 1;

-- exercicio h modificado para fazer sentido
select ID_Nf,
sum(Quantidade) 
from tbl_vendas where
 Quantidade>10 group by ID_Nf;

-- exercicio i
select ID_Nf ,sum(Quantidade * Valor_unit) as total
from tbl_vendas
group by ID_Nf
having total> 500
order by total desc;

-- exercicio j 
Select
Cod_produto, avg(Desconto) as media 
from tbl_vendas
group by Cod_produto;

-- exercicio k 
select Cod_produto, max(Desconto) as Maior, min(Desconto) as Menor,
avg(Desconto) as medias
from tbl_vendas
group by Cod_produto;

-- exercicio l
Select ID_Nf,
count(Quantidade) as quantidade
from tbl_vendas
group by ID_Nf
having quantidade>3;
