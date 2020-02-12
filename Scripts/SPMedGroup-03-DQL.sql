CREATE DATABASE SPMedGroupDQL;

USE SPMedGroupDDL;

SELECT * FROM Consulta;

SELECT Paciente.NomePaciente, Paciente.CPF, Paciente.RG, Paciente.Data_Nascimento, Paciente.Telefone,	
		Paciente.Email, Consulta.DataHora,
		CASE 
			WHEN IdClinica = 5 THEN 'SPGroup'
		END AS IdClinica FROM Paciente
		INNER JOIN Consulta ON Consulta.IdPaciente = Paciente.IdPaciente

SELECT Paciente.NomePaciente, Paciente.CPF, Paciente.RG, Paciente.Data_Nascimento, Paciente.Telefone,	
		Paciente.Email, Consulta.DataHora, ClinicaMedica.NomeClinica
		FROM Paciente
		INNER JOIN Consulta ON Consulta.IdPaciente = Paciente.IdPaciente
		INNER JOIN ClinicaMedica ON Consulta.IdClinica = ClinicaMedica.IdClinica

SELECT Paciente.NomePaciente, Paciente.CPF, Paciente.RG, Paciente.Data_Nascimento, Paciente.Telefone,	
		Paciente.Email, Consulta.DataHora, Medico.NomeMedico, Medico.CNPJ, Medico.CRM, Especialidade.TipoEspecialidade FROM Consulta
		INNER JOIN Paciente ON Paciente.IdPaciente = Consulta.IdPaciente
		INNER JOIN Medico ON Medico.IdMedico = Consulta.IdMedico
		INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade

SELECT Medico.NomeMedico, Medico.CNPJ, Medico.CRM, Especialidade.TipoEspecialidade FROM Especialidade
INNER JOIN Medico ON Especialidade.IdEspecialidade = Medico.IdEspecialidade

SELECT Medico.NomeMedico, Medico.IdEspecialidade, Medico.CNPJ, Medico.CRM, ClinicaMedica.NomeClinica FROM Medico
INNER JOIN ClinicaMedica ON ClinicaMedica.IdClinica = Medico.IdClinica

SELECT Medico.NomeMedico, Medico.IdEspecialidade, Medico.CNPJ, Medico.CRM, ClinicaMedica.NomeClinica FROM Medico
INNER JOIN ClinicaMedica ON ClinicaMedica.IdClinica = Medico.IdClinica
WHERE Medico.IdEspecialidade = 2

-- Quantidade de usuários
SELECT COUNT (IdPaciente) FROM Paciente
-- Data
SELECT CONVERT (VARCHAR(10), Data_Nascimento, 101) AS [Mês/Dia/Ano] FROM Paciente

--Médico e sua especialide 
SELECT Especialidade.TipoEspecialidade, Medico.NomeMedico FROM Medico
INNER JOIN Especialidade ON Especialidade.IdEspecialidade = Medico.IdEspecialidade

--IDADE PACIENTE
SELECT Paciente.NomePaciente, DATEDIFF(Year, Paciente.Data_Nascimento, GETDATE()) AS Idade FROM Paciente

-- FUNCTION 
CREATE FUNCTION dbo.RetornarQtdMed 
	(@Valor1 INT)
	RETURNS
	AS
	BEGIN 
		SElECT COUNT (IdEspecialidade) FROM Especialidade
		RETURN @Valor1
	END
	
--PROCEDURE
CREATE PROCEDURE RetornaIdade
@ID INT
AS
SELECT YEAR(GETDATE())-YEAR(Data_Nascimento)-IIF(MONTH(GETDATE())*32+DAY(GETDATE())<MONTH(Data_Nascimento)*32+DAY(Data_Nascimento),1,0) AS Idade
FROM Paciente
WHERE IdPaciente = @ID
 
EXECUTE RetornaIdade 1;
