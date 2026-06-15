CREATE TABLE Genero(
    IdGenero INT IDENTITY(1,1) PRIMARY KEY,
    Genero VARCHAR(100)
);
CREATE TABLE CEstados(
    IdEstado INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50)
);
CREATE TABLE CCarreras(
    IdCarrera INT IDENTITY(1,1) PRIMARY KEY,
    NombreCarreras VARCHAR(50),
    Estatus BIT
);
CREATE TABLE CTipoPersonal(
    IdTipo INT IDENTITY(1,1) PRIMARY KEY,
    Personal VARCHAR(100)
);
CREATE TABLE CMunicipio(
    IdMunicipio INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50),
    IdEstado INT,

    CONSTRAINT FK_Municipio_Estado
    FOREIGN KEY(IdEstado)
    REFERENCES CEstados(IdEstado)
);
CREATE TABLE CLocalidad(
    IdLocalidad INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50),
    IdMunicipio INT,

    CONSTRAINT FK_Localidad_Municipio
    FOREIGN KEY(IdMunicipio)
    REFERENCES CMunicipio(IdMunicipio)
);
CREATE TABLE CDatosPersonales(
    IdDatosP INT IDENTITY(1,1) PRIMARY KEY,
    Nombre VARCHAR(50),
    FechaNacimiento DATE,
    Curp VARCHAR(20),
    Email VARCHAR(100),
    Telefono VARCHAR(10),
    Calle VARCHAR(80),
    NumE INT,
    NumI INT,
    CP INT,

    IdLocalidad INT,
    IdMunicipio INT,
    IdEstado INT,
    IdGenero INT,

    FOREIGN KEY(IdLocalidad)
    REFERENCES CLocalidad(IdLocalidad),

    FOREIGN KEY(IdMunicipio)
    REFERENCES CMunicipio(IdMunicipio),

    FOREIGN KEY(IdEstado)
    REFERENCES CEstados(IdEstado),

    FOREIGN KEY(IdGenero)
    REFERENCES Genero(IdGenero)
);
CREATE TABLE CAlumnos(
    Matricula VARCHAR(20) PRIMARY KEY,
    IdCarrera INT,
    IdDatosP INT,
    Status BIT,

    FOREIGN KEY(IdCarrera)
    REFERENCES CCarreras(IdCarrera),

    FOREIGN KEY(IdDatosP)
    REFERENCES CDatosPersonales(IdDatosP)
);
CREATE TABLE CPersonal(
    IdPersonal INT IDENTITY(1,1) PRIMARY KEY,
    IdDatosP INT,
    IdTipo INT,
    ClaveEmp VARCHAR(10),
    Status BIT,

    FOREIGN KEY(IdDatosP)
    REFERENCES CDatosPersonales(IdDatosP),

    FOREIGN KEY(IdTipo)
    REFERENCES CTipoPersonal(IdTipo)
);
CREATE TABLE CDatosEscuela(
    CCT VARCHAR(10) PRIMARY KEY,
    Nombre VARCHAR(100),
    Telefono VARCHAR(10),
    Email VARCHAR(100),
    Calle VARCHAR(80),
    NumE INT,
    NumI INT,
    IdLocalidad INT,
    IdMunicipio INT,
    IdEstado INT,
    CP INT
);