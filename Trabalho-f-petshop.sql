create table tbf_Veterinario(
    vet_cod int PRIMARY KEY,
    vet_crmv varchar(30),
    vet_cpf varchar (30),
    vet_rg varchar (30),
    vet_endereço varchar (60),
    vet_name varchar(60)  
);

create table tbf_Pets(
    pet_nome varchar(30),
    pet_tipo varchar(30),
    pet_cod int primary key,
    pet_raca varchar (30),
    pet_data_nasc date
);

create table tbf_vacinas_Pet(
    vacina_data date,
    vacina_nome varchar (30),
    vacina_id int PRIMARY key
);

create table tbf_Func_De_Tratamento(
    func_cod int primary key,
    func_rg varchar(30),
    func_cpf varchar (30),
    func_nome varchar (60)
);

create table tbf_serviços(
    serviços_id int primary key,
    serviçoes_preço float,
    serviço_name varchar(60)
);

create table tbf_clientes(
    cli_name varchar (60),
    cli_end varchar (60),
    cli_rg varchar (30),
    cli_cpf varchar (30),
    cli_cod int primary key
);

create table tbf_produtos(
    pro_preco_uni float,
    pro_name varchar(60),
    pro_descri varchar(120),
    pro_cod int primary key
);

create table tbf_fornecedores(
    for_cnpj varchar (30),
    for_name varchar (60),
    for_end varchar(60),
    for_cod int primary key
);

create table tbf_consultar(
    vet_cod int,
    pet_cod int,
    foreign vet_cod references tbf_Veterinario,
    foreign pet_cod references tbf_Pets,
    const_id int primary key,
    const_date date,
    const_hora
);

create table tbf_vacinas_tomadas(
    pet_cod int,
    vacina_id int,
    foreign pet_cod references tbf_Pets,
    foreign vacina_id references tbf_vacinas_Pet
);

create table tbf_tratamentos_serviços(
    func_cod int,
    serviços_id int,
    pet_cod int,
    foreign pet_cod references tbf_Pets,
    foreign func_cod references tbf_Func_De_Tratamento,
    foreign serviços_id references tbf_serviços
    
);

create table tbf_indicar_produtos(
    pet_cod int,
    vet_cod int,
    pro_cod int,
    foreign pet_cod references tbf_Pets,
    foreign vet_cod references tbf_Veterinario,
    foreign pro_cod references tbf_produtos
);

create table possui(
    pet_cod int,
    cli_cod int,
    foreign cli_cod references tbf_clientes,
    foreign pet_cod references tbf_Pets
);

create table comprar(
    cli_cod int,
    pro_cod int,
    foreign cli_cod references tbf_clientes,
    foreign pro_cod references tbf_produtos,
    comp_cod int primary key,
    comp_quantidade int,
    comp_valor float
);

create table fornercer_produto(
    pro_cod int,
    for_cod int,
    foreign pro_cod references tbf_produtos,
    foreign for_cod references tbf_fornecedores
);




