/*
SENAC DF - CEP Jessé Freire
2024.07.276 - Aprendizagem Profissional de Qualificação em Desenvolvimento de Softwares Profo Hudson Neves
Projeto Final - Implementação de Banco de Dados Relacional com MySQ1
Projeto - Clinica Odontológica OdontoVida */
-- 1. Criação do Arquivo/Banco de Dados
create database OdontoVida;
-- 2. Acessando Arquivo/Banco de Dados
use OdontoVida;

-- 3 Criando Tablelas 
CREATE TABLE Paciente (
paciente_id INT AUTO_INCREMENT PRIMARY KEY, 
nome VARCHAR(100) NOT NULL,
data_nascimento DATE NOT NULL,
telefone VARCHAR(20),
endereco TEXT,
email VARCHAR(100)
); 
CREATE TABLE Dentista (
dentista_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
especialidade VARCHAR(50),
telefone VARCHAR(20),
email VARCHAR(100)
);
CREATE TABLE Consulta (
consulta_id INT AUTO_INCREMENT PRIMARY KEY,
paciente_id INT,
dentista_id INT,
data_consulta DATETIME,
FOREIGN KEY (paciente_id) REFERENCES Paciente (paciente_id), 
FOREIGN KEY (dentista_id) REFERENCES Dentista(dentista_id)
);

CREATE TABLE Tratamento (
tratamento_id INT AUTO_INCREMENT PRIMARY KEY,
consulta_id INT,
descricao TEXT,
data_inicio DATE,
data_fim DATE,
FOREIGN KEY (consulta_id) REFERENCES Consulta (consulta_id)
);
CREATE TABLE Procedimento (
procedimento_id INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
custo DECIMAL(18, 2) NOT NULL
);
CREATE TABLE Tratamento_Procedimento (
tratamento_id INT,
procedimento_id INT,
quantidade INT DEFAULT 1,
PRIMARY KEY (tratamento_id, procedimento_id),
FOREIGN KEY (tratamento_id) REFERENCES Tratamento(tratamento_id),
FOREIGN KEY (procedimento_id) REFERENCES Procedimento(procedimento_id)
);
CREATE TABLE Pagamento (
pagamento_id INT AUTO_INCREMENT PRIMARY KEY,
tratamento_id INT,
valor DECIMAL(18, 2) NOT NULL,
data_pagamento DATE,
FOREIGN KEY (tratamento_id) REFERENCES Tratamento (tratamento_id)
);

