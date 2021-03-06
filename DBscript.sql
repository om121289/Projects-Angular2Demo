USE Test
GO
/****** Object:  Table [dbo].[ApplicationUsers]    Script Date: 4/11/2018 7:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[ApplicationUsers](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmailID] [nvarchar](50) NULL,
	[UserName] [nvarchar](50) NOT NULL,
	[Password] [varbinary](50) NOT NULL,
	[RoleId] [int] NOT NULL,
 CONSTRAINT [PK_ApplicationUsers] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Designations]    Script Date: 4/11/2018 7:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Designations](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Designations] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Employees]    Script Date: 4/11/2018 7:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[EmloyeeName] [nvarchar](50) NOT NULL,
	[DesignationId] [int] NOT NULL,
	[Address] [nvarchar](150) NOT NULL,
	[Department] [nvarchar](50) NULL,
	[Salary] [decimal](19, 4) NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[UserRoles]    Script Date: 4/11/2018 7:00:04 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserRoles](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_UserRoles] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[ApplicationUsers] ON 

INSERT [dbo].[ApplicationUsers] ([Id], [EmailID], [UserName], [Password], [RoleId]) VALUES (1, N'om1212@gmail.com', N'hari', 0x68617269, 2)
INSERT [dbo].[ApplicationUsers] ([Id], [EmailID], [UserName], [Password], [RoleId]) VALUES (2, N'binod@gmail.com', N'binod', 0x62696E6F64, 1)
SET IDENTITY_INSERT [dbo].[ApplicationUsers] OFF
SET IDENTITY_INSERT [dbo].[Designations] ON 

INSERT [dbo].[Designations] ([Id], [Name]) VALUES (1, N'A')
INSERT [dbo].[Designations] ([Id], [Name]) VALUES (2, N'B')
INSERT [dbo].[Designations] ([Id], [Name]) VALUES (3, N'C')
SET IDENTITY_INSERT [dbo].[Designations] OFF
SET IDENTITY_INSERT [dbo].[Employees] ON 

INSERT [dbo].[Employees] ([Id], [EmloyeeName], [DesignationId], [Address], [Department], [Salary]) VALUES (2, N'Hari', 1, N'adsad dsadsad', N'abc', CAST(1000.0000 AS Decimal(19, 4)))
INSERT [dbo].[Employees] ([Id], [EmloyeeName], [DesignationId], [Address], [Department], [Salary]) VALUES (3, N'Binod', 2, N'zxczxc czxczxc', N'bca', CAST(1000000.0000 AS Decimal(19, 4)))
SET IDENTITY_INSERT [dbo].[Employees] OFF
SET IDENTITY_INSERT [dbo].[UserRoles] ON 

INSERT [dbo].[UserRoles] ([ID], [RoleName]) VALUES (1, N'Admin')
INSERT [dbo].[UserRoles] ([ID], [RoleName]) VALUES (2, N'user')
INSERT [dbo].[UserRoles] ([ID], [RoleName]) VALUES (3, N'superuser')
SET IDENTITY_INSERT [dbo].[UserRoles] OFF
ALTER TABLE [dbo].[ApplicationUsers]  WITH CHECK ADD  CONSTRAINT [FK_ApplicationUsers_UserRoles] FOREIGN KEY([RoleId])
REFERENCES [dbo].[UserRoles] ([ID])
GO
ALTER TABLE [dbo].[ApplicationUsers] CHECK CONSTRAINT [FK_ApplicationUsers_UserRoles]
GO
ALTER TABLE [dbo].[Employees]  WITH CHECK ADD  CONSTRAINT [FK_Employees_Designation] FOREIGN KEY([DesignationId])
REFERENCES [dbo].[Designations] ([Id])
GO
ALTER TABLE [dbo].[Employees] CHECK CONSTRAINT [FK_Employees_Designation]
GO
