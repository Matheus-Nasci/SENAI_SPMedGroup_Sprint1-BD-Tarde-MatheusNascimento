CREATE DATABASE SPMedGroup_DML;

USE SPMedGroup_DDL;

INSERT INTO Clinica(NomeClinica, Endereco, CEP)
VALUES	('SPMedGroup','Alameda Bar�o de Limeira, 539','01202001');

INSERT INTO TipoUsuario (TituloTipoUsuario)
VALUES ('Administrador'),('M�dico'),('Paciente');

INSERT INTO Especialidade (TipoEspecialidade)
VALUES	('Acupuntura'),
		('Anestesiologia'),
		('Angiologia'),
		('Cardiologia'),
		('Cirurgia Cardiovascular'),
		('Cirurgia da M�o'),
		('Cirurgia do Aparelho Digestivo'),
		('Cirurgia Geral'),
		('Cirurgia Pedi�trica'),
		('Cirurgia Tor�cica'),
		('Cirurgia Vascular'),
		('Dermatologia'),
		('Radioterapia'),
		('Urologia'),
		('Pediatria'),
		('Psiquiatria');

INSERT INTO Situacao (TipoSituacao)
VALUES ('Agendada'),('Realizada'),('Cancelada');

INSERT INTO Administrador (Email, Senha, IdTipoUsuario)
VALUES	('matheus@hotmail.com','matheus123', 1),
		('saulo@gmail.com','423201',1),
		('caroll@outlook.com','0810235',1);

INSERT INTO Paciente (NomePaciente, CPF, RG, Data_Nascimento, Endere�o, Telefone, Email, Senha, IdTipoUsuario)
VALUES	('Ligia','9483985900','435225435','13/10/1983','Rua Estado de Israel 240,�S�o Paulo, Estado de S�o Paulo, 04022000','34567654','ligia@gmail.com','ligiaa2815',3),
		('Alexandre','7355694405','326543457','23/07/2001','Av. Paulista, 1578 - Bela Vista, S�o Paulo - SP, 01310200','987656543','alexandre@gmail.com','26474133878',3),
		('Fernando','1683933800','546365253','10/10/1978','Av. Ibirapuera - Indian�polis, 2927,  S�o Paulo - SP, 04029200','972084453','fernando@gmail.com','374738',3),
		('Henrique','1433265475','543663625','13/10/1985','R. Vit�ria, 120 - Vila Sao Jorge, Barueri - SP, 06402030','34566543','henrique@gmail.com','3748',3),
		('Jo�o','91305348011','325928471','27/08/1975','R. Ver. Geraldo de Camargo, 66 - Santa Luzia, Ribeir�o Pires - SP, 09405380','76566377','joao@hotmail.com','93849134',3),
		('Bruno','79799299004','545662667','21/03/1972','Alameda dos Arapan�s, 945 - Indian�polis, S�o Paulo - SP, 04524001','954368769','bruno@gmail.com','Bruninho1223',3),
		('Mariana','13771913039','545662668','05/03/2018','R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407140','954362849','mariana@outlook.com','28828201',3);

INSERT INTO Medico (NomeMedico, Email, Senha, CRM, CNPJ, IdEspecialidade, IdClinica, IdTipoUsuario)
VALUES	('Ricardo Lemos','ricardo.lemos@spmedicalgroup.com.br','12283812394','54356','8640090220130',2,5,2),
		('Roberto Possarle','roberto.possarle@spmedicalgroup.com.br','827735785785','53452','86448902000130',15,5,2),
		('Helena Strada','helena.souza@spmedicalgroup.com.br','1W18U812YFDFJH','65463','86400902010130',16,5,2);
		
INSERT INTO Consulta (DataHora, IdClinica,IdMedico,IdPaciente,IdSituacao)
VALUES	('12/01/2020',5,12,3,2),
		('20/08/2019',5,11,1,1),
		('16/03/2018',5,12,2,2),
		('12/12/2019',5,13,5,1),
		('11/10/2019',5,13,6,3),
		('03/09/2017',5,11,7,2),
		('08/03/2019',5,12,1,3);
INSERT INTO Paciente (NomePaciente, CPF, RG, Data_Nascimento, Endere�o, Telefone, Email, Senha, IdTipoUsuario)
VALUES('Felipe','03771913039','545662632','05/03/2018','R Sao Antonio, 232 - Vila Universal, Barueri - SP, 06407140','159362849','felipee@outlook.com','28820291',3);

--Excluir dados que n�o possuem data de cadastro 
DELETE FROM Paciente
WHERE IdPaciente = 10;
