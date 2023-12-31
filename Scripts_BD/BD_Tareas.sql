USE [BD_Tareas]
GO
/****** Object:  Table [dbo].[Tarea]    Script Date: 1/10/2023 18:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tarea](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Titulo] [nvarchar](50) NULL,
	[Descripcion] [nvarchar](250) NULL,
	[Fecha_registro] [date] NULL,
	[Completada] [nvarchar](10) NULL,
	[Fecha_finalizacion] [date] NULL,
	[Estado] [int] NULL,
	[Modificado] [date] NULL,
 CONSTRAINT [PK_Tarea] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  StoredProcedure [dbo].[sp_CompletarTarea]    Script Date: 1/10/2023 18:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- modificar
CREATE   PROCEDURE [dbo].[sp_CompletarTarea]
	@Id int,
    @Completada nvarchar(10)
	
AS
	update Tarea
	set 
	Completada=@Completada

	where Id = @Id;

SET ANSI_NULLS ON
GO
/****** Object:  StoredProcedure [dbo].[sp_CrearTarea]    Script Date: 1/10/2023 18:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_CrearTarea]
     @Titulo nvarchar(50),
     @Descripcion nvarchar(250),
     @FechaRegistro date,
     @Completada nvarchar(10),
	 @FechaFinalizacion date

AS
    insert into Tarea (Titulo,Descripcion,Fecha_registro,Completada,Fecha_finalizacion,Estado)
        values (@Titulo,@Descripcion,@FechaRegistro,@Completada,@FechaFinalizacion,0)
GO
/****** Object:  StoredProcedure [dbo].[sp_EliminarTarea]    Script Date: 1/10/2023 18:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE   PROCEDURE [dbo].[sp_EliminarTarea]
    @Id int
AS
    update Tarea
    set Estado=1, Modificado=GETDATE()
    where Id = @Id;
GO
/****** Object:  StoredProcedure [dbo].[sp_ListaTareas]    Script Date: 1/10/2023 18:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- listar
CREATE   PROCEDURE [dbo].[sp_ListaTareas]
	@Filtro nvarchar(100)
AS
IF @Filtro <> ''
BEGIN
	SELECT 
		Id,
		Titulo, 
		Descripcion,
		Fecha_registro,
		Completada,
		Fecha_finalizacion
	from Tarea
	where 
	Titulo like '%'+@Filtro+'%'
	or Descripcion like '%'+@Filtro+'%'
	or Fecha_registro like '%'+@Filtro+'%'
	or Fecha_finalizacion like '%'+@Filtro+'%'
	or Completada like '%'+@Filtro+'%'

	and Estado = 0
END 
ELSE 
BEGIN
	SELECT 
		Id,
		Titulo, 
		Descripcion,
		Fecha_registro,
		Completada,
		Fecha_Finalizacion
	from Tarea
	where Estado = 0
END 
GO
/****** Object:  StoredProcedure [dbo].[sp_ModificarTarea]    Script Date: 1/10/2023 18:00:02 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- modificar
CREATE   PROCEDURE [dbo].[sp_ModificarTarea]
	@Id int,
    @Titulo nvarchar(50),
    @Descripcion nvarchar(250),
	@FechaFinalizacion nvarchar(250)
	
AS
	update Tarea
	set 
	Titulo=@Titulo,
	Descripcion = @Descripcion,
	Fecha_finalizacion = @FechaFinalizacion

	where Id = @Id;

SET ANSI_NULLS ON
GO
