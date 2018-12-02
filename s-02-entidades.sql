--@Autor(es):       Gutiérrez Castillo Oscar, Valderrama Navarro Armando
--@Fecha creación:  01/12/2018
--@Descripción:     Creacion de tablas y secuencias


CREATE TABLE CARRERA( --CATALOGO DE CARRERAS
	CARRERA_ID	NUMBER(2,0)		NOT NULL,
	NOMBRE	 	VARCHAR2(50) 	NOT NULL,	
	CLAVE		NUMBER(3,0) 	NOT NULL,
	DESCRIPCION VARCHAR2(150)	NOT NULL,
	CONSTRAINT PK_CARRERA PRIMARY KEY (CARRERA_ID)
);

CREATE TABLE PLAN_ESTUDIOS( --CATALOGO DE PLAN DE ESTUDIOS
	PLAN_ESTUDIOS_ID 	NUMBER(4,0)	NOT NULL,
	CLAVE 				VARCHAR2(7)	NOT NULL,
	FECHA_APROVACION	DATE		NOT NULL,
	FECHA_TERMINO		DATE		NULL,--Solo si ya remplazo el plan de esutdios
	CONSTRAINT PK_PLAN_ESTUDIOS PRIMARY KEY (PLAN_ESTUDIOS_ID)
);

CREATE TABLE ASIGNATURA( --ASIGNATURAS
	ASIGNATURA_ID 			NUMBER(4,0) NOT NULL,
	CLAVE 					NUMBER(4,0) NOT NULL,
	NOMBRE					VARCHAR2(50) NOT NULL,
	SEMESTRE_CURSAR			NUMBER(2) NOT NULL,
	CREDITOS 				NUMBER(2,0) NOT NULL,
	PLAN_ESTUDIOS 			NUMBER(4,0) NOT NULL,
	--------Reservado a materias que sean de una carrera en particular--------
	ASIGNATURA_ANTECEDENTE 	NUMBER(4,0) NULL, 
	SEMESTRE_IMPARTICION 	NUMBER(2) NULL,
	--------Reservado a materias que sean de una carrera en particular--------
	CONSTRAINT PK_ASIGNATURA PRIMARY KEY (ASIGNATURA_ID),
	CONSTRAINT FK_ASIGNATURA_ANTECEDENTE FOREIGN KEY (ASIGNATURA_ANTECEDENTE)
    REFERENCES ASIGNATURA(ASIGNATURA_ID)
);

CREATE TABLE ESTUDIANTE( --ESTUDIANTES
	ESTUDIANTE_ID 		NUMBER(6,0) NOT NULL,
	NOMBRE				VARCHAR2(50) NOT NULL,
	AP_PATERNO 			VARCHAR2(50) NOT NULL,
	AP_MATERNO 			VARCHAR2(50) NULL,
	FECHA_NACIMIENTO 	DATE NOT NULL,
	NUMERO_CUENTA 		NUMBER(10) NOT NULL,
	CEDULA_PROFESIONAL	NUMBER(10) NULL, --Se asigna cuando la tesis del estudiante pasa al estado CON_CEDULA
	CARRERA_ID			NUMBER(2,0)		NOT NULL,
	PLAN_ESTUDIOS_ID 	NUMBER(4,0)	NOT NULL,
	CONSTRAINT PK_ESTUDIANTE PRIMARY KEY (ESTUDIANTE_ID),
	CONSTRAINT FK_CARRERA_ID FOREIGN KEY (CARRERA_ID)
	REFERENCES CARRERA(CARRERA_ID),
	CONSTRAINT FK_PLAN_ESTUDIOS_ID FOREIGN KEY (PLAN_ESTUDIOS_ID)
	REFERENCES PLAN_ESTUDIOS(PLAN_ESTUDIOS_ID)
);

CREATE TABLE DIA_SEMANA( --CATALOGO DIAS DE LA SEMANA
	DIA_SEMANA_ID 	NUMBER(6) NOT NULL,
	DESCRIPCION 	VARCHAR2(10) NOT NULL,
	CONSTRAINT PK_DIA_SEMANA PRIMARY KEY (DIA_SEMANA_ID)
	CONSTRAINT CHK_DIA_SEMANA_ID
  	CHECK (DIA_SEMANA_ID BETWEEN 1 and 6) --Lunes a sábado
);

CREATE TABLE HORARIO( --CATALOGO DE HORARIOS (DEPENDE DE DIA_SEMANA)
	HORARIO_ID		NUMBER(5,0) NOT NULL,
	DIA_IMPARTICION	NUMBER(1) 	NOT NULL,
	NUMERO_SALON	VARCHAR2(4) NOT NULL,
	NUMERO_CLASE	NUMBER(5) 	NOT NULL,
	HORA_INICIO		DATE		NOT NULL,
	HORA_FIN		DATE		NOT NULL,
	CONSTRAINT PK_HORARIO PRIMARY KEY (HORARIO_ID),
	CONSTRAINT FK_DIA_IMPARTICION FOREIGN KEY (NUMERO_CLASE)
	REFERENCES DIA_SEMANA(DIA_SEMANA_ID)
	CONSTRAINT CHK_NUMERO_CLASE
  	CHECK (NUMERO_CLASE BETWEEN 1 and 5)
);

CREATE TABLE SEMESTRE( --Catalogo de semstre
	SEMESTRE_ID	NUMBER(3) NOT NULL,
	ANIO		NUMBER(4) NOT NULL,
	PERIODO		NUMBER(1) NOT NULL,
	CONSTRAINT PK_SEMESTRE PRIMARY KEY (SEMESTRE_ID)
);


CREATE TABLE CURSO(
	CURSO_ID		NUMBER(10,0)	NOT NULL,
	ASIGNATURA_ID 	NUMBER(4,0) 	NOT NULL,
	SEMESTRE_ID		NUMBER(3) 		NOT NULL,
	PROFESOR_ID		
	NUM_GRUPO		NUMBER(4)		NOT NULL,
	HORARIO_ID		NUMBER(5,0) 	NOT NULL,
);








