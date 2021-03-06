USE [master]
GO

/****** Object:  Database [Tappit]    Script Date: 29/11/2021 09:41:32 ******/
DROP DATABASE [Tappit]
GO

/****** Object:  Database [Tappit]    Script Date: 29/11/2021 09:41:32 ******/
CREATE DATABASE [Tappit]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tappit', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Tappit.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Tappit_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL12.SQLEXPRESS\MSSQL\DATA\Tappit_log.ldf' , SIZE = 1024KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO

ALTER DATABASE [Tappit] SET COMPATIBILITY_LEVEL = 120
GO

IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tappit].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO

ALTER DATABASE [Tappit] SET ANSI_NULL_DEFAULT OFF 
GO

ALTER DATABASE [Tappit] SET ANSI_NULLS OFF 
GO

ALTER DATABASE [Tappit] SET ANSI_PADDING OFF 
GO

ALTER DATABASE [Tappit] SET ANSI_WARNINGS OFF 
GO

ALTER DATABASE [Tappit] SET ARITHABORT OFF 
GO

ALTER DATABASE [Tappit] SET AUTO_CLOSE OFF 
GO

ALTER DATABASE [Tappit] SET AUTO_SHRINK OFF 
GO

ALTER DATABASE [Tappit] SET AUTO_UPDATE_STATISTICS ON 
GO

ALTER DATABASE [Tappit] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO

ALTER DATABASE [Tappit] SET CURSOR_DEFAULT  GLOBAL 
GO

ALTER DATABASE [Tappit] SET CONCAT_NULL_YIELDS_NULL OFF 
GO

ALTER DATABASE [Tappit] SET NUMERIC_ROUNDABORT OFF 
GO

ALTER DATABASE [Tappit] SET QUOTED_IDENTIFIER OFF 
GO

ALTER DATABASE [Tappit] SET RECURSIVE_TRIGGERS OFF 
GO

ALTER DATABASE [Tappit] SET  DISABLE_BROKER 
GO

ALTER DATABASE [Tappit] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO

ALTER DATABASE [Tappit] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO

ALTER DATABASE [Tappit] SET TRUSTWORTHY OFF 
GO

ALTER DATABASE [Tappit] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO

ALTER DATABASE [Tappit] SET PARAMETERIZATION SIMPLE 
GO

ALTER DATABASE [Tappit] SET READ_COMMITTED_SNAPSHOT OFF 
GO

ALTER DATABASE [Tappit] SET HONOR_BROKER_PRIORITY OFF 
GO

ALTER DATABASE [Tappit] SET RECOVERY SIMPLE 
GO

ALTER DATABASE [Tappit] SET  MULTI_USER 
GO

ALTER DATABASE [Tappit] SET PAGE_VERIFY CHECKSUM  
GO

ALTER DATABASE [Tappit] SET DB_CHAINING OFF 
GO

ALTER DATABASE [Tappit] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO

ALTER DATABASE [Tappit] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO

ALTER DATABASE [Tappit] SET DELAYED_DURABILITY = DISABLED 
GO

ALTER DATABASE [Tappit] SET  READ_WRITE 
GO


