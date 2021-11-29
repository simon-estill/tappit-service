USE [Tappit]
GO

/****** Object:  Table [dbo].[People]    Script Date: 29/11/2021 09:38:20 ******/
DROP TABLE [dbo].[People]
GO

/****** Object:  Table [dbo].[People]    Script Date: 29/11/2021 09:38:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[People](
	[PersonId] [bigint] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](50) NOT NULL,
	[LastName] [nvarchar](50) NOT NULL,
	[IsValid] [bit] NOT NULL,
	[IsEnabled] [bit] NOT NULL,
	[IsAuthorised] [bit] NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [Tappit]
GO

/****** Object:  Table [dbo].[Sports]    Script Date: 29/11/2021 09:39:25 ******/
DROP TABLE [dbo].[Sports]
GO

/****** Object:  Table [dbo].[Sports]    Script Date: 29/11/2021 09:39:25 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Sports](
	[SportId] [bigint] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NOT NULL,
	[IsEnabled] [bit] NOT NULL,
 CONSTRAINT [PK_Sports] PRIMARY KEY CLUSTERED 
(
	[SportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO


USE [Tappit]
GO

ALTER TABLE [dbo].[FavouriteSports] DROP CONSTRAINT [FK_FavouriteKeys_Sports]
GO

ALTER TABLE [dbo].[FavouriteSports] DROP CONSTRAINT [FK_FavouriteKeys_People]
GO

/****** Object:  Table [dbo].[FavouriteSports]    Script Date: 29/11/2021 09:40:20 ******/
DROP TABLE [dbo].[FavouriteSports]
GO

/****** Object:  Table [dbo].[FavouriteSports]    Script Date: 29/11/2021 09:40:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[FavouriteSports](
	[PersonId] [bigint] NOT NULL,
	[SportId] [bigint] NOT NULL,
 CONSTRAINT [PK_FavouriteSports] PRIMARY KEY CLUSTERED 
(
	[PersonId] ASC,
	[SportId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

ALTER TABLE [dbo].[FavouriteSports]  WITH CHECK ADD  CONSTRAINT [FK_FavouriteKeys_People] FOREIGN KEY([PersonId])
REFERENCES [dbo].[People] ([PersonId])
GO

ALTER TABLE [dbo].[FavouriteSports] CHECK CONSTRAINT [FK_FavouriteKeys_People]
GO

ALTER TABLE [dbo].[FavouriteSports]  WITH CHECK ADD  CONSTRAINT [FK_FavouriteKeys_Sports] FOREIGN KEY([SportId])
REFERENCES [dbo].[Sports] ([SportId])
GO

ALTER TABLE [dbo].[FavouriteSports] CHECK CONSTRAINT [FK_FavouriteKeys_Sports]
GO


