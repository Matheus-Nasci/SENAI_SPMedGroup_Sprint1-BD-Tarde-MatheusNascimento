CREATE DATABASE SPMedGroup_DDL;

USE SPMedGroup_DDL;

CREATE TABLE Clinica (
	IdClinica	INT PRIMARY KEY IDENTITY,
	NomeClinica	VARCHAR(255) NOT NULL,
	Endereco	VARCHAR(255) NOT NULL,
	CEP			CHAR(8) NOT NULL
	);

CREATE TABLE TipoUsuario (
	IdTipoUsuario		INT PRIMARY KEY IDENTITY,
	TituloTipoUsuario	VARCHAR(255) NOT NULL UNIQUE
	);

CREATE TABLE Especialidade (
	IdEspecialidade INT PRIMARY KEY IDENTITY,
	TipoEspecialidade	VARCHAR(255) NOT NULL
	);

CREATE TABLE Situacao (
	IdSituacao		INT PRIMARY KEY IDENTITY,
	TipoSituacao	VARCHAR(255) NOT NULL UNIQUE
	);

CREATE TABLE Usuario (
	IdUsuario		INT PRIMARY KEY IDENTITY,
	EmailUsuario	VARCHAR(255) NOT NULL UNIQUE,
	SenhaUsuario	VARCHAR(255) NOT NULL 
	IdTipoUsuario	INT	FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
	);

CREATE TABLE Paciente (
	IdPaciente		INT PRIMARY KEY IDENTITY,
	NomePaciente	VARCHAR (255),
	CPF				CHAR (11),
	RG				CHAR (9),
	Data_Nascimento	DATETIME2,
	Endereço		VARCHAR (255),
	Telefone		CHAR (9),
	EmailPaciente	VARCHAR (255),
	IdTipoUsuario	INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
	);

CREATE TABLE Medico (
	IdMedico	INT PRIMARY KEY IDENTITY,
	NomeMedico	VARCHAR (255),
	EmailMedico VARCHAR (255),
	CRM			CHAR (6),
	CNPJ		CHAR (14),
	IdEspecialidade INT FOREIGN KEY REFERENCES Especialidade (IdEspecialidade),
	IdClinica		INT FOREIGN KEY REFERENCES Clinica (IdClinica),
	IdTipoUsuario	INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
	);

CREATE TABLE Consulta (
	IdConsulta	INT PRIMARY KEY IDENTITY,
	DataHora	DATETIME2,
	IdClinica	INT FOREIGN KEY REFERENCES Clinica(IdClinica),
	IdMedico	INT FOREIGN KEY REFERENCES Medico(IdMedico),
	IdPaciente	INT FOREIGN KEY REFERENCES Paciente(IdPaciente),
	IdSituacao	INT FOREIGN KEY REFERENCES Situacao(IdSituacao)
	);