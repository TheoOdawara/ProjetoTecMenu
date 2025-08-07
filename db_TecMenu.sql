-- Criação do schema
CREATE SCHEMA IF NOT EXISTS db_TecMenu;
USE db_TecMenu;

-- Tabela: usuario
CREATE TABLE IF NOT EXISTS usuario (
    id_usuario INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_usu VARCHAR(255) NOT NULL,
    cargo VARCHAR(50),
    tel_usu VARCHAR(25),
    senha_usu VARCHAR(50)
);

-- Tabela: categoria
CREATE TABLE IF NOT EXISTS categoria (
    id_cat INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_cat VARCHAR(50) NOT NULL
);

-- Tabela: fabricante
CREATE TABLE IF NOT EXISTS fabricante (
    id_fabricante INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_fab VARCHAR(255) NOT NULL,
    tel_fab VARCHAR(25),
    cnpj BIGINT
);

-- Tabela: produto
CREATE TABLE IF NOT EXISTS produto (
    id_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_prod VARCHAR(50) NOT NULL,
    id_cat INT,
    qtd INT,
    id_fabricante INT,
    CONSTRAINT fk_prod_cat FOREIGN KEY (id_cat)
        REFERENCES categoria(id_cat)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_prod_fab FOREIGN KEY (id_fabricante)
        REFERENCES fabricante(id_fabricante)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabela: prato
CREATE TABLE IF NOT EXISTS prato (
    id_prato INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    nome_prato VARCHAR(50) NOT NULL,
    descricao VARCHAR(255)
);

-- Tabela: prato_produto (tabela de junção)
CREATE TABLE IF NOT EXISTS prato_produto (
    id_prato_produto INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_prato INT NOT NULL,
    id_produto INT NOT NULL,
    quantidade_necessaria INT,
    CONSTRAINT fk_pp_prato FOREIGN KEY (id_prato)
        REFERENCES prato (id_prato)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_pp_produto FOREIGN KEY (id_produto)
        REFERENCES produto (id_produto)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabela: cadastro (relação usuário-produto)
CREATE TABLE IF NOT EXISTS cadastro (
    id_cadastro INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_usuario INT NOT NULL,
    CONSTRAINT fk_cad_prod FOREIGN KEY (id_produto)
        REFERENCES produto (id_produto)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_cad_usu FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabela: solicita (registro de solicitações)
CREATE TABLE IF NOT EXISTS solicita (
    id_solicitacao INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_usuario INT NOT NULL,
    soli_dt TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_soli_prod FOREIGN KEY (id_produto)
        REFERENCES produto (id_produto)
        ON DELETE CASCADE
        ON UPDATE CASCADE,
    CONSTRAINT fk_soli_usu FOREIGN KEY (id_usuario)
        REFERENCES usuario (id_usuario)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

-- Tabela: menu

create table if not exists menu (
id_menu int not null primary key auto_increment,
nome_prato varchar(50),
descricao varchar(255)
);

-- Tabela: compra (registro de compras de produtos)
CREATE TABLE compra (
    id_compra INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    id_produto INT NOT NULL,
    id_usuario INT NOT NULL,
    quantidade INT NOT NULL,
    data_compra TIMESTAMP DEFAULT (CURRENT_TIMESTAMP),
    FOREIGN KEY (id_produto) REFERENCES produto(id_produto)
        ON UPDATE CASCADE,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id_usuario)
        ON UPDATE CASCADE
);

INSERT INTO prato (nome_prato, descricao) VALUES
('Arroz com Feijão', 'Arroz branco com feijão carioca, acompanhamento tradicional.'),
('Carne Assada', 'Carne bovina assada com batatas ao forno.'),
('Baião de Dois', 'Mistura de arroz, feijão verde e carne seca.'),
('Estrogonofe de Frango', 'Frango ao molho cremoso com creme de leite e ketchup.'),
('Feijoada', 'Feijão preto com carnes defumadas, prato típico brasileiro.'),
('Frango Grelhado', 'Peito de frango grelhado com ervas.'),
('Moqueca de Peixe', 'Peixe cozido com leite de coco, pimentões e coentro.'),
('Escondidinho de Carne', 'Carne moída coberta com purê de batatas.'),
('Macarrão à Bolonhesa', 'Macarrão com molho de carne moída ao tomate.'),
('Lasanha de Frango', 'Camadas de massa, frango desfiado, queijo e molho.'),
('Salada Completa', 'Folhas verdes, tomate, ovo e legumes variados.'),
('Panqueca de Carne', 'Panquecas recheadas com carne moída e molho vermelho.'),
('Sopa de Legumes', 'Sopa quente com batata, cenoura, chuchu e macarrão.'),
('Tutu de Feijão', 'Feijão engrossado com farinha e acompanhamentos.'),
('Arroz à Grega', 'Arroz com legumes picados e uvas-passas.'),
('Peixe Frito', 'Filé de peixe empanado e frito.'),
('Frango ao Curry', 'Frango cozido com molho de curry e arroz branco.'),
('Risoto de Frango', 'Arroz cremoso com frango desfiado e legumes.'),
('Arroz Carreteiro', 'Arroz com carne seca, linguiça e cheiro-verde.'),
('Omelete de Legumes', 'Ovos batidos com legumes e queijo.'),
('Chili com Carne', 'Feijão vermelho com carne moída e pimenta.'),
('Cuscuz Nordestino', 'Cuscuz de milho com ovos, sardinha e legumes.'),
('Farofa de Ovo', 'Farinha de mandioca com ovos mexidos e cebola.'),
('Dobradinha', 'Bucho bovino cozido com feijão branco e temperos.'),
('Almôndegas com Molho', 'Bolinhas de carne com molho de tomate.'),
('Frango Xadrez', 'Frango com legumes ao molho oriental.'),
('Quibe Assado', 'Quibe de carne com trigo, recheado ou não.'),
('Esfiha de Carne', 'Massa fina recheada com carne temperada.'),
('Hambúrguer Caseiro', 'Hambúrguer artesanal com pão, carne e queijo.'),
('Strogonoff de Carne', 'Carne ao molho cremoso de mostarda e ketchup.'),
('Tacos Mexicanos', 'Tortilhas recheadas com carne, queijo e guacamole.'),
('Pasta ao Pesto', 'Massa com molho pesto de manjericão e pinhões.'),
('Canelone de Ricota', 'Massa recheada com ricota e espinafre, coberta com molho de tomate.');

INSERT INTO categoria (nome_cat) VALUES
('Tempero'),
('Proteína'),
('Legume'),
('Verdura'),
('Grão');

INSERT INTO fabricante (nome_fab, tel_fab, cnpj) VALUES
('Sabor & Cia Alimentos','2133221122', 12345678000195),
('Delícias do Campo LTDA','21988774433', 98765432000101),
('NutriMais Indústria','1122334455', 45678912000177),
('Alimentos Naturallis','31999887766', 11223344000122),
('Bom Grão S/A','11987654321', 33445566000199),
('VerdeVida Produtos Orgânicos','11999221100', 55443322000188),
('TropiFruta Alimentos','21987651234', 66778899000166),
('Grãos do Brasil LTDA','21994443322', 77889911000155),
('Essencial Alimentos','31991112222', 88990077000144),
('Doce Lar Indústria Alimentícia','21992221111', 99887766000133);

INSERT INTO produto (nome_prod, id_cat, qtd, id_fabricante) VALUES
('Arroz', '5', '0', '1'),
('Feijão', '5', '0', '1'),
('Feijão Preto', '5', '0', '1'),
('Feijão Branco', '5', '0', '1'),
('Batata', '3', '0', '2'),
('Cebola', '3', '0', '2'),
('Cenoura', '3', '0', '2'),
('Tomate', '3', '0', '2'),
('Carne Bovina', '2', '0', '3'),
('Carne Seca', '2', '0', '2'),
('Linguiça', '2', '0', '3'),
('Frango', '2', '0', '3'),
('Pimentão', '3', '0', '4'),
('Espinafre', '4', '0', '4'),
('Rúcula', '4', '0', '3'),
('Peixe', '2', '0', '4'),
('Trigo', '5', '0', '5'),
('Macarrão', '5', '0', '5'),
('Massa', '5', '0', '5'),
('Pão', '5', '0', '5'),
('Farinha de Mandioca', '5', '0', '6'),
('Molho de Tomate', '1', '0', '6'),
('Creme de Leite', '2', '0', '6'),
('Queijo', '2', '0', '1'),
('Ovos', '2', '0', '7'),
('Sardinha', '2', '0', '6'),
('Tortilha', '5', '0', '7'),
('Feijão Verde', '5', '0', '7'),
('Pinhões', '5', '0', '8'),
('Temperos', '1', '0', '8'),
('Curry', '1', '0', '8'),
('Ervas Finas', '1', '0', '2'),
('Sal', '1', '0', '9'),
('Pimenta', '1', '0', '9'),
('Azeite', '1', '0', '9'),
('Alho', '1', '0', '10');

INSERT INTO prato_produto (id_prato, id_produto, quantidade_necessaria) VALUES
-- Arroz com Feijão
((SELECT id_prato FROM prato WHERE nome_prato = 'Arroz com Feijão'), (SELECT id_produto FROM produto WHERE nome_prod = 'Arroz'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Arroz com Feijão'), (SELECT id_produto FROM produto WHERE nome_prod = 'Feijão'), 1),

-- Carne Assada
((SELECT id_prato FROM prato WHERE nome_prato = 'Carne Assada'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Carne Assada'), (SELECT id_produto FROM produto WHERE nome_prod = 'Batata'), 2),

-- Baião de Dois
((SELECT id_prato FROM prato WHERE nome_prato = 'Baião de Dois'), (SELECT id_produto FROM produto WHERE nome_prod = 'Arroz'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Baião de Dois'), (SELECT id_produto FROM produto WHERE nome_prod = 'Feijão Verde'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Baião de Dois'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Seca'), 0.5),

-- Estrogonofe de Frango
((SELECT id_prato FROM prato WHERE nome_prato = 'Estrogonofe de Frango'), (SELECT id_produto FROM produto WHERE nome_prod = 'Frango'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Estrogonofe de Frango'), (SELECT id_produto FROM produto WHERE nome_prod = 'Creme de Leite'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Estrogonofe de Frango'), (SELECT id_produto FROM produto WHERE nome_prod = 'Cebola'), 0.5),

-- Feijoada
((SELECT id_prato FROM prato WHERE nome_prato = 'Feijoada'), (SELECT id_produto FROM produto WHERE nome_prod = 'Feijão Preto'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Feijoada'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Feijoada'), (SELECT id_produto FROM produto WHERE nome_prod = 'Linguiça'), 1),

-- Frango Grelhado
((SELECT id_prato FROM prato WHERE nome_prato = 'Frango Grelhado'), (SELECT id_produto FROM produto WHERE nome_prod = 'Frango'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Frango Grelhado'), (SELECT id_produto FROM produto WHERE nome_prod = 'Ervas Finas'), 0.5),

-- Moqueca de Peixe
((SELECT id_prato FROM prato WHERE nome_prato = 'Moqueca de Peixe'), (SELECT id_produto FROM produto WHERE nome_prod = 'Peixe'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Moqueca de Peixe'), (SELECT id_produto FROM produto WHERE nome_prod = 'Pimentão'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Moqueca de Peixe'), (SELECT id_produto FROM produto WHERE nome_prod = 'Cebola'), 0.5),

-- Escondidinho de Carne
((SELECT id_prato FROM prato WHERE nome_prato = 'Escondidinho de Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Escondidinho de Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Batata'), 2),

-- Macarrão à Bolonhesa
((SELECT id_prato FROM prato WHERE nome_prato = 'Macarrão à Bolonhesa'), (SELECT id_produto FROM produto WHERE nome_prod = 'Macarrão'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Macarrão à Bolonhesa'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Macarrão à Bolonhesa'), (SELECT id_produto FROM produto WHERE nome_prod = 'Molho de Tomate'), 0.5),

-- Lasanha de Frango
((SELECT id_prato FROM prato WHERE nome_prato = 'Lasanha de Frango'), (SELECT id_produto FROM produto WHERE nome_prod = 'Frango'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Lasanha de Frango'), (SELECT id_produto FROM produto WHERE nome_prod = 'Queijo'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Lasanha de Frango'), (SELECT id_produto FROM produto WHERE nome_prod = 'Macarrão'), 1),

-- Salada Completa
((SELECT id_prato FROM prato WHERE nome_prato = 'Salada Completa'), (SELECT id_produto FROM produto WHERE nome_prod = 'Tomate'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Salada Completa'), (SELECT id_produto FROM produto WHERE nome_prod = 'Cebola'), 0.5),
((SELECT id_prato FROM prato WHERE nome_prato = 'Salada Completa'), (SELECT id_produto FROM produto WHERE nome_prod = 'Espinafre'), 1),

-- Panqueca de Carne
((SELECT id_prato FROM prato WHERE nome_prato = 'Panqueca de Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Panqueca de Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Farinha de Mandioca'), 1),

-- Sopa de Legumes
((SELECT id_prato FROM prato WHERE nome_prato = 'Sopa de Legumes'), (SELECT id_produto FROM produto WHERE nome_prod = 'Batata'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Sopa de Legumes'), (SELECT id_produto FROM produto WHERE nome_prod = 'Cebola'), 0.5),
((SELECT id_prato FROM prato WHERE nome_prato = 'Sopa de Legumes'), (SELECT id_produto FROM produto WHERE nome_prod = 'Tomate'), 0.5),

-- Tutu de Feijão
((SELECT id_prato FROM prato WHERE nome_prato = 'Tutu de Feijão'), (SELECT id_produto FROM produto WHERE nome_prod = 'Feijão'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Tutu de Feijão'), (SELECT id_produto FROM produto WHERE nome_prod = 'Farinha de Mandioca'), 1),

-- Arroz à Grega
((SELECT id_prato FROM prato WHERE nome_prato = 'Arroz à Grega'), (SELECT id_produto FROM produto WHERE nome_prod = 'Arroz'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Arroz à Grega'), (SELECT id_produto FROM produto WHERE nome_prod = 'Cebola'), 0.5),
((SELECT id_prato FROM prato WHERE nome_prato = 'Arroz à Grega'), (SELECT id_produto FROM produto WHERE nome_prod = 'Pimentão'), 0.5),

-- Peixe Frito
((SELECT id_prato FROM prato WHERE nome_prato = 'Peixe Frito'), (SELECT id_produto FROM produto WHERE nome_prod = 'Peixe'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Peixe Frito'), (SELECT id_produto FROM produto WHERE nome_prod = 'Farinha de Mandioca'), 1),

-- Frango ao Curry
((SELECT id_prato FROM prato WHERE nome_prato = 'Frango ao Curry'), (SELECT id_produto FROM produto WHERE nome_prod = 'Frango'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Frango ao Curry'), (SELECT id_produto FROM produto WHERE nome_prod = 'Curry'), 0.5),

-- Risoto de Frango
((SELECT id_prato FROM prato WHERE nome_prato = 'Risoto de Frango'), (SELECT id_produto FROM produto WHERE nome_prod = 'Frango'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Risoto de Frango'), (SELECT id_produto FROM produto WHERE nome_prod = 'Arroz'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Risoto de Frango'), (SELECT id_produto FROM produto WHERE nome_prod = 'Cebola'), 0.5),

-- Arroz Carreteiro
((SELECT id_prato FROM prato WHERE nome_prato = 'Arroz Carreteiro'), (SELECT id_produto FROM produto WHERE nome_prod = 'Arroz'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Arroz Carreteiro'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Arroz Carreteiro'), (SELECT id_produto FROM produto WHERE nome_prod = 'Linguiça'), 0.5),

-- Omelete de Legumes
((SELECT id_prato FROM prato WHERE nome_prato = 'Omelete de Legumes'), (SELECT id_produto FROM produto WHERE nome_prod = 'Ovos'), 2),
((SELECT id_prato FROM prato WHERE nome_prato = 'Omelete de Legumes'), (SELECT id_produto FROM produto WHERE nome_prod = 'Tomate'), 0.5),
((SELECT id_prato FROM prato WHERE nome_prato = 'Omelete de Legumes'), (SELECT id_produto FROM produto WHERE nome_prod = 'Cebola'), 0.5),

-- Chili com Carne
((SELECT id_prato FROM prato WHERE nome_prato = 'Chili com Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Chili com Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Feijão'), 1),

-- Cuscuz Nordestino
((SELECT id_prato FROM prato WHERE nome_prato = 'Cuscuz Nordestino'), (SELECT id_produto FROM produto WHERE nome_prod = 'Farinha de Mandioca'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Cuscuz Nordestino'), (SELECT id_produto FROM produto WHERE nome_prod = 'Sardinha'), 1),

-- Farofa de Ovo
((SELECT id_prato FROM prato WHERE nome_prato = 'Farofa de Ovo'), (SELECT id_produto FROM produto WHERE nome_prod = 'Farinha de Mandioca'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Farofa de Ovo'), (SELECT id_produto FROM produto WHERE nome_prod = 'Ovos'), 2),

-- Dobradinha
((SELECT id_prato FROM prato WHERE nome_prato = 'Dobradinha'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Dobradinha'), (SELECT id_produto FROM produto WHERE nome_prod = 'Feijão Branco'), 1),

-- Almôndegas com Molho
((SELECT id_prato FROM prato WHERE nome_prato = 'Almôndegas com Molho'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Almôndegas com Molho'), (SELECT id_produto FROM produto WHERE nome_prod = 'Molho de Tomate'), 0.5),

-- Frango Xadrez
((SELECT id_prato FROM prato WHERE nome_prato = 'Frango Xadrez'), (SELECT id_produto FROM produto WHERE nome_prod = 'Frango'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Frango Xadrez'), (SELECT id_produto FROM produto WHERE nome_prod = 'Pimentão'), 1),

-- Quibe Assado
((SELECT id_prato FROM prato WHERE nome_prato = 'Quibe Assado'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Quibe Assado'), (SELECT id_produto FROM produto WHERE nome_prod = 'Trigo'), 1),

-- Esfiha de Carne
((SELECT id_prato FROM prato WHERE nome_prato = 'Esfiha de Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Esfiha de Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Massa'), 1),

-- Hambúrguer Caseiro
((SELECT id_prato FROM prato WHERE nome_prato = 'Hambúrguer Caseiro'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Hambúrguer Caseiro'), (SELECT id_produto FROM produto WHERE nome_prod = 'Pão'), 1),

-- Strogonoff de Carne
((SELECT id_prato FROM prato WHERE nome_prato = 'Strogonoff de Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Strogonoff de Carne'), (SELECT id_produto FROM produto WHERE nome_prod = 'Creme de Leite'), 1),

-- Tacos Mexicanos
((SELECT id_prato FROM prato WHERE nome_prato = 'Tacos Mexicanos'), (SELECT id_produto FROM produto WHERE nome_prod = 'Carne Bovina'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Tacos Mexicanos'), (SELECT id_produto FROM produto WHERE nome_prod = 'Tortilha'), 1),

-- Pasta ao Pesto
((SELECT id_prato FROM prato WHERE nome_prato = 'Pasta ao Pesto'), (SELECT id_produto FROM produto WHERE nome_prod = 'Macarrão'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Pasta ao Pesto'), (SELECT id_produto FROM produto WHERE nome_prod = 'Pinhões'), 0.5),

-- Canelone de Ricota
((SELECT id_prato FROM prato WHERE nome_prato = 'Canelone de Ricota'), (SELECT id_produto FROM produto WHERE nome_prod = 'Massa'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Canelone de Ricota'), (SELECT id_produto FROM produto WHERE nome_prod = 'Queijo'), 1),
((SELECT id_prato FROM prato WHERE nome_prato = 'Canelone de Ricota'), (SELECT id_produto FROM produto WHERE nome_prod = 'Espinafre'), 0.5);

INSERT INTO usuario (nome_usu, cargo, tel_usu, senha_usu)
VALUES ('admin', 'admin', '21964405406', 'admin');