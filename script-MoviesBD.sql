USE [master]
GO
/****** Object:  Database [MoviesDB]    Script Date: 10/25/2019 6:40:24 AM ******/
CREATE DATABASE [MoviesDB]
GO

USE [MoviesDB]
GO

/****** Object:  Table [dbo].[Categories]    Script Date: 10/25/2019 6:40:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[idCategory] [int] IDENTITY(1,1) NOT NULL,
	[category] [varchar](20) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[idCategory] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 10/25/2019 6:40:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[idMovie] [int] IDENTITY(1,1) NOT NULL,
	[idCategory] [int] NULL,
	[title] [varchar](50) NULL,
	[release] [int] NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[idMovie] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subscriptions]    Script Date: 10/25/2019 6:40:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subscriptions](
	[idSubscription] [int] IDENTITY(1,1) NOT NULL,
	[idUser] [int] NULL,
	[idCategory] [int] NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[idSubscription] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 10/25/2019 6:40:24 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[idUser] [int] IDENTITY(1,1) NOT NULL,
	[username] [varchar](12) NULL,
	[password] [varchar](25) NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[idUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Categories] ON 
GO
INSERT [dbo].[Categories] ([idCategory], [category]) VALUES (1, N'Action')
GO
INSERT [dbo].[Categories] ([idCategory], [category]) VALUES (2, N'SciFi')
GO
INSERT [dbo].[Categories] ([idCategory], [category]) VALUES (3, N'Comedy')
GO
INSERT [dbo].[Categories] ([idCategory], [category]) VALUES (4, N'Horror')
GO
INSERT [dbo].[Categories] ([idCategory], [category]) VALUES (5, N'Animated')
GO
SET IDENTITY_INSERT [dbo].[Categories] OFF
GO
SET IDENTITY_INSERT [dbo].[Movies] ON 
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (1, 1, N'John Wick', 2014)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (2, 1, N'Casino Royale', 2006)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (3, 1, N'Mission: Impossible III', 2006)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (4, 1, N'The Day After Tomorrow', 2004)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (5, 1, N'The Transporter', 2002)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (6, 2, N'Avatar', 2009)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (7, 2, N'Matrix', 1999)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (8, 2, N'A.I. Artificial Intelligence', 2001)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (9, 2, N'Back To The Future ', 1985)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (10, 2, N'Starship Troopers', 1997)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (11, 3, N'The Hangover', 2009)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (12, 3, N'Happy Gilmore', 1996)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (13, 3, N'Austin Powers in Goldmember', 2002)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (14, 3, N'White Chicks', 2004)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (15, 3, N'Zoolander', 2001)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (16, 4, N'The Ring', 2002)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (17, 4, N'The Shining', 1980)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (18, 4, N'The Exorcist', 1973)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (19, 4, N'The Conjuring', 2013)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (20, 4, N'The Last Exorcism', 2010)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (21, 5, N'Coco', 2017)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (22, 5, N'Big Hero 6', 2014)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (23, 5, N'Inside Out', 2015)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (24, 5, N'WALL-E', 2008)
GO
INSERT [dbo].[Movies] ([idMovie], [idCategory], [title], [release]) VALUES (25, 5, N'Shrek', 2001)
GO
SET IDENTITY_INSERT [dbo].[Movies] OFF
GO
SET IDENTITY_INSERT [dbo].[Subscriptions] ON 
GO
INSERT [dbo].[Subscriptions] ([idSubscription], [idUser], [idCategory]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Subscriptions] ([idSubscription], [idUser], [idCategory]) VALUES (2, 1, 2)
GO
INSERT [dbo].[Subscriptions] ([idSubscription], [idUser], [idCategory]) VALUES (3, 1, 3)
GO
INSERT [dbo].[Subscriptions] ([idSubscription], [idUser], [idCategory]) VALUES (4, 1, 4)
GO
INSERT [dbo].[Subscriptions] ([idSubscription], [idUser], [idCategory]) VALUES (5, 1, 5)
GO
INSERT [dbo].[Subscriptions] ([idSubscription], [idUser], [idCategory]) VALUES (6, 2, 1)
GO
INSERT [dbo].[Subscriptions] ([idSubscription], [idUser], [idCategory]) VALUES (7, 2, 3)
GO
SET IDENTITY_INSERT [dbo].[Subscriptions] OFF
GO
SET IDENTITY_INSERT [dbo].[Users] ON 
GO
INSERT [dbo].[Users] ([idUser], [username], [password]) VALUES (1, N'fullextras', N'all4all')
GO
INSERT [dbo].[Users] ([idUser], [username], [password]) VALUES (2, N'owasp', N'top10')
GO
SET IDENTITY_INSERT [dbo].[Users] OFF
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Categories] FOREIGN KEY([idCategory])
REFERENCES [dbo].[Categories] ([idCategory])
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Categories]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Categories] FOREIGN KEY([idCategory])
REFERENCES [dbo].[Categories] ([idCategory])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Permissions_Categories]
GO
ALTER TABLE [dbo].[Subscriptions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Users] FOREIGN KEY([idUser])
REFERENCES [dbo].[Users] ([idUser])
GO
ALTER TABLE [dbo].[Subscriptions] CHECK CONSTRAINT [FK_Permissions_Users]
GO
USE [master]
GO
ALTER DATABASE [MoviesDB] SET  READ_WRITE 
GO
