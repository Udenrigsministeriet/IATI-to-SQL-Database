USE [master]
GO
/****** Object:  Database [IATIv201]    Script Date: 21-03-2017 11:25:18 ******/
CREATE DATABASE [IATIv201]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'IATI', FILENAME = N'D:\SqlData\IATIv201.mdf' , SIZE = 821248KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'IATI_log', FILENAME = N'E:\SqlLog\IATIv201_log.ldf' , SIZE = 353216KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
GO
ALTER DATABASE [IATIv201] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [IATIv201].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [IATIv201] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [IATIv201] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [IATIv201] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [IATIv201] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [IATIv201] SET ARITHABORT OFF 
GO
ALTER DATABASE [IATIv201] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [IATIv201] SET AUTO_SHRINK ON 
GO
ALTER DATABASE [IATIv201] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [IATIv201] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [IATIv201] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [IATIv201] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [IATIv201] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [IATIv201] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [IATIv201] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [IATIv201] SET  DISABLE_BROKER 
GO
ALTER DATABASE [IATIv201] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [IATIv201] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [IATIv201] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [IATIv201] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [IATIv201] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [IATIv201] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [IATIv201] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [IATIv201] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [IATIv201] SET  MULTI_USER 
GO
ALTER DATABASE [IATIv201] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [IATIv201] SET DB_CHAINING OFF 
GO
ALTER DATABASE [IATIv201] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [IATIv201] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [IATIv201] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'IATIv201', N'ON'
GO
ALTER DATABASE [IATIv201] SET QUERY_STORE = OFF
GO
USE [IATIv201]
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [IATIv201]
GO
/****** Object:  User [NT AUTHORITY\NETWORK SERVICE]    Script Date: 20-02-2017 11:25:18 ******/
CREATE USER [NT AUTHORITY\NETWORK SERVICE] FOR LOGIN [NT AUTHORITY\NETWORK SERVICE] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [IatiFileGenerator]    Script Date: 20-02-2017 11:25:18 ******/
CREATE USER [IatiFileGenerator] WITHOUT LOGIN WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER ROLE [db_datareader] ADD MEMBER [NT AUTHORITY\NETWORK SERVICE]
GO
ALTER ROLE [db_owner] ADD MEMBER [IatiFileGenerator]
GO
/****** Object:  Schema [AgressoSourceData]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [AgressoSourceData]
GO
/****** Object:  Schema [AgressoTransformation]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [AgressoTransformation]
GO
/****** Object:  Schema [Codelist]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [Codelist]
GO
/****** Object:  Schema [Configuration]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [Configuration]
GO
/****** Object:  Schema [EDRMSourceData]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [EDRMSourceData]
GO
/****** Object:  Schema [FMI]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [FMI]
GO
/****** Object:  Schema [IATI]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [IATI]
GO
/****** Object:  Schema [IATISchema]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [IATISchema]
GO
/****** Object:  Schema [PublicationControl]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [PublicationControl]
GO
/****** Object:  Schema [UM]    Script Date: 20-02-2017 11:25:18 ******/
CREATE SCHEMA [UM]
GO
/****** Object:  XmlSchemaCollection [IATISchema].[SchemaCollection_2.01]    Script Date: 20-02-2017 11:25:18 ******/
CREATE XML SCHEMA COLLECTION [IATISchema].[SchemaCollection_2.01] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"><xsd:import namespace="http://www.w3.org/XML/1998/namespace" /><xsd:attribute name="base" type="xsd:anyURI" /><xsd:attribute name="currency" type="xsd:string" /><xsd:attribute name="lang" type="xsd:language" /><xsd:attribute name="space" default="preserve"><xsd:simpleType><xsd:restriction base="xsd:NCName"><xsd:enumeration value="default" /><xsd:enumeration value="preserve" /></xsd:restriction></xsd:simpleType></xsd:attribute><xsd:attribute name="value-date" type="xsd:date" /><xsd:complexType name="currencyType"><xsd:simpleContent><xsd:extension base="xsd:decimal"><xsd:attribute ref="currency" /><xsd:attribute ref="value-date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType><xsd:element name="activity-date"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" use="required" /><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="activity-scope"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="activity-status"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="period-start"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period-end"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="capital-spend"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="percentage" type="xsd:decimal" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="collaboration-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="comment" type="textRequiredType" /><xsd:element name="conditions"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="condition" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="attached" type="xsd:boolean" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="contact-info"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="organisation" type="textRequiredType" minOccurs="0" /><xsd:element name="department" type="textRequiredType" minOccurs="0" /><xsd:element name="person-name" type="textRequiredType" minOccurs="0" /><xsd:element name="job-title" type="textRequiredType" minOccurs="0" /><xsd:element name="telephone" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="email" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="website" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:anyURI"><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="mailing-address" type="textRequiredType" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="country-budget-items"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="budget-item" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="description" type="textRequiredType" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="percentage" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="vocabulary" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="crs-add"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="other-flags" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="significance" type="xsd:boolean" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="loan-terms" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="repayment-type" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="repayment-plan" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="commitment-date" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="repayment-first-date" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="repayment-final-date" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="rate-1" type="xsd:decimal" /><xsd:attribute name="rate-2" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="loan-status" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="interest-received" type="xsd:decimal" minOccurs="0" /><xsd:element name="principal-outstanding" type="xsd:decimal" minOccurs="0" /><xsd:element name="principal-arrears" type="xsd:decimal" minOccurs="0" /><xsd:element name="interest-arrears" type="xsd:decimal" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="year" type="xsd:decimal" use="required" /><xsd:attribute ref="currency" /><xsd:attribute ref="value-date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-aid-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-finance-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-flow-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-tied-status"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="description"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="document-link"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="title" /><xsd:element name="category" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="language" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="url" type="xsd:anyURI" use="required" /><xsd:attribute name="format" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="fss"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="forecast" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:decimal"><xsd:attribute name="year" type="xsd:decimal" use="required" /><xsd:attribute ref="currency" /><xsd:attribute ref="value-date" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="extraction-date" type="xsd:date" use="required" /><xsd:attribute name="priority" type="xsd:boolean" /><xsd:attribute name="phaseout-year" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-activities"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="iati-activity" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="version" type="xsd:string" use="required" /><xsd:attribute name="generated-datetime" type="xsd:dateTime" /><xsd:attribute name="linked-data-default" type="xsd:anyURI" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-activity"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="iati-identifier" /><xsd:element ref="reporting-org" /><xsd:element name="title" type="textRequiredType" /><xsd:element name="description" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element ref="participating-org" maxOccurs="unbounded" /><xsd:element ref="other-identifier" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="activity-status" /><xsd:element ref="activity-date" maxOccurs="unbounded" /><xsd:element ref="contact-info" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="activity-scope" minOccurs="0" /><xsd:element ref="recipient-country" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="recipient-region" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="location" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="sector" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="country-budget-items" minOccurs="0" /><xsd:element ref="policy-marker" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="collaboration-type" minOccurs="0" /><xsd:element ref="default-flow-type" minOccurs="0" /><xsd:element ref="default-finance-type" minOccurs="0" /><xsd:element ref="default-aid-type" minOccurs="0" /><xsd:element ref="default-tied-status" minOccurs="0" /><xsd:element ref="budget" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="planned-disbursement" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="capital-spend" minOccurs="0" /><xsd:element ref="transaction" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="document-link" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="related-activity" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="legacy-data" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="conditions" minOccurs="0" /><xsd:element ref="result" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="crs-add" minOccurs="0" /><xsd:element ref="fss" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="last-updated-datetime" type="xsd:dateTime" /><xsd:attribute ref="xml:lang" /><xsd:attribute name="default-currency" type="xsd:string" /><xsd:attribute name="hierarchy" type="xsd:int" /><xsd:attribute name="linked-data-uri" type="xsd:anyURI" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-identifier"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="legacy-data"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="name" type="xsd:string" use="required" /><xsd:attribute name="value" type="xsd:string" use="required" /><xsd:attribute name="iati-equivalent" type="xsd:NMTOKEN" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="location"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="location-reach" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="location-id" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="vocabulary" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="name" type="textRequiredType" minOccurs="0" /><xsd:element name="description" type="textRequiredType" minOccurs="0" /><xsd:element name="activity-description" type="textRequiredType" minOccurs="0" /><xsd:element name="administrative" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="vocabulary" type="xsd:string" use="required" /><xsd:attribute name="level" type="xsd:nonNegativeInteger" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="point" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="pos" type="xsd:string" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="srsName" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="exactness" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="location-class" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="feature-designation" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="narrative"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:attribute ref="xml:lang" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="other-identifier"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="owner-org" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" use="required" /><xsd:attribute name="type" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="participating-org"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="type" type="xsd:string" /><xsd:attribute name="role" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="planned-disbursement"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="period-start"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period-end" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="policy-marker"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="significance" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-country"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="percentage" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-region"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="percentage" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="related-activity"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" use="required" /><xsd:attribute name="type" type="xsd:string" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="reporting-org"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" use="required" /><xsd:attribute name="type" type="xsd:string" use="required" /><xsd:attribute name="secondary-reporter" type="xsd:boolean" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="result"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="title" /><xsd:element ref="description" minOccurs="0" /><xsd:element name="indicator" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="title" /><xsd:element ref="description" minOccurs="0" /><xsd:element name="baseline" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="comment" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="year" type="xsd:positiveInteger" use="required" /><xsd:attribute name="value" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="period-start"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period-end"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="target" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="comment" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="value" type="xsd:string" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="actual" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="comment" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="value" type="xsd:string" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="measure" type="xsd:string" use="required" /><xsd:attribute name="ascending" type="xsd:boolean" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" use="required" /><xsd:attribute name="aggregation-status" type="xsd:boolean" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="sector"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="percentage" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="title" type="textRequiredType" /><xsd:element name="transaction"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="transaction-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="transaction-date"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="value" type="currencyType" /><xsd:element name="description" type="textRequiredType" minOccurs="0" /><xsd:element name="provider-org" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="provider-activity-id" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="receiver-org" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="receiver-activity-id" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="disbursement-channel" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="sector" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-country" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-region" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="flow-type" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="finance-type" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="aid-type" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="tied-status" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:attributeGroup name="specialAttrs"><xsd:attribute ref="xml:lang" /><xsd:attribute ref="xml:space" /><xsd:attribute ref="xml:base" /></xsd:attributeGroup><xsd:complexType name="textRequiredType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="textType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema>'
GO
/****** Object:  XmlSchemaCollection [IATISchema].[SchemaCollection_2.02]    Script Date: 20-02-2017 11:25:18 ******/
CREATE XML SCHEMA COLLECTION [IATISchema].[SchemaCollection_2.02] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"><xsd:import namespace="http://www.w3.org/XML/1998/namespace" /><xsd:attribute name="currency" type="xsd:string" /><xsd:complexType name="currencyType"><xsd:simpleContent><xsd:extension base="xsd:decimal"><xsd:attribute ref="currency" /><xsd:attribute name="value-date" type="xsd:anySimpleType" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType><xsd:element name="activity-date"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" use="required" /><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="activity-scope"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="activity-status"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="period-start"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period-end"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" /><xsd:attribute name="status" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="capital-spend"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="percentage" type="xsd:decimal" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="collaboration-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="conditions"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="condition" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="attached" type="xsd:boolean" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="contact-info"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="organisation" type="textRequiredType" minOccurs="0" /><xsd:element name="department" type="textRequiredType" minOccurs="0" /><xsd:element name="person-name" type="textRequiredType" minOccurs="0" /><xsd:element name="job-title" type="textRequiredType" minOccurs="0" /><xsd:element name="telephone" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="email" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="website" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:anyURI"><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="mailing-address" type="textRequiredType" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="country-budget-items"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="budget-item" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="description" type="textRequiredType" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="percentage" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="vocabulary" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="crs-add"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="other-flags" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="significance" type="xsd:boolean" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="loan-terms" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="repayment-type" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="repayment-plan" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="commitment-date" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="repayment-first-date" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="repayment-final-date" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="rate-1" type="xsd:decimal" /><xsd:attribute name="rate-2" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="loan-status" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="interest-received" type="xsd:decimal" minOccurs="0" /><xsd:element name="principal-outstanding" type="xsd:decimal" minOccurs="0" /><xsd:element name="principal-arrears" type="xsd:decimal" minOccurs="0" /><xsd:element name="interest-arrears" type="xsd:decimal" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="year" type="xsd:decimal" use="required" /><xsd:attribute ref="currency" /><xsd:attribute name="value-date" type="xsd:anySimpleType" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="channel-code" type="xsd:string" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-aid-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-finance-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-flow-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-tied-status"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="document-link"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="title" type="xsd:anyType" /><xsd:element name="category" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="language" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="document-date" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="url" type="xsd:anyURI" use="required" /><xsd:attribute name="format" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="fss"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="forecast" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:decimal"><xsd:attribute name="year" type="xsd:decimal" use="required" /><xsd:attribute ref="currency" /><xsd:attribute name="value-date" type="xsd:anySimpleType" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="extraction-date" type="xsd:date" use="required" /><xsd:attribute name="priority" type="xsd:boolean" /><xsd:attribute name="phaseout-year" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="humanitarian-scope"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" use="required" /><xsd:attribute name="vocabulary" type="xsd:string" use="required" /><xsd:attribute name="vocabulary-uri" type="xsd:anyURI" /><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-activities"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="iati-activity" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="version" type="xsd:string" use="required" /><xsd:attribute name="value-date" type="xsd:date" /><xsd:attribute name="generated-datetime" type="xsd:dateTime" /><xsd:attribute name="linked-data-default" type="xsd:anyURI" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-activity"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="iati-identifier" /><xsd:element ref="reporting-org" /><xsd:element name="title" type="textRequiredType" /><xsd:element name="description" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element ref="participating-org" maxOccurs="unbounded" /><xsd:element ref="other-identifier" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="activity-status" /><xsd:element ref="activity-date" maxOccurs="unbounded" /><xsd:element ref="contact-info" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="activity-scope" minOccurs="0" /><xsd:element ref="recipient-country" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="recipient-region" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="location" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="sector" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="country-budget-items" minOccurs="0" /><xsd:element ref="humanitarian-scope" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="policy-marker" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="collaboration-type" minOccurs="0" /><xsd:element ref="default-flow-type" minOccurs="0" /><xsd:element ref="default-finance-type" minOccurs="0" /><xsd:element ref="default-aid-type" minOccurs="0" /><xsd:element ref="default-tied-status" minOccurs="0" /><xsd:element ref="budget" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="planned-disbursement" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="capital-spend" minOccurs="0" /><xsd:element ref="transaction" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="document-link" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="related-activity" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="reporting-org" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="legacy-data" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="conditions" minOccurs="0" /><xsd:element ref="result" minOccurs="0" maxOccurs="unbounded" /><xsd:element ref="crs-add" minOccurs="0" /><xsd:element ref="fss" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="last-updated-datetime" type="xsd:dateTime" /><xsd:attribute ref="xml:lang" /><xsd:attribute name="default-currency" type="xsd:string" /><xsd:attribute name="humanitarian" type="xsd:boolean" /><xsd:attribute name="hierarchy" type="xsd:int" /><xsd:attribute name="linked-data-uri" type="xsd:anyURI" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-identifier"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="legacy-data"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="name" type="xsd:string" use="required" /><xsd:attribute name="value" type="xsd:string" use="required" /><xsd:attribute name="iati-equivalent" type="xsd:NMTOKEN" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="location"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="location-reach" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="location-id" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="vocabulary" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="name" type="textRequiredType" minOccurs="0" /><xsd:element name="description" type="textRequiredType" minOccurs="0" /><xsd:element name="activity-description" type="textRequiredType" minOccurs="0" /><xsd:element name="administrative" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="vocabulary" type="xsd:string" use="required" /><xsd:attribute name="level" type="xsd:nonNegativeInteger" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="point" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="pos" type="xsd:string" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="srsName" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="exactness" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="location-class" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="feature-designation" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="narrative"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:attribute ref="xml:lang" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="other-identifier"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="owner-org" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" use="required" /><xsd:attribute name="type" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="participating-org"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="type" type="xsd:string" /><xsd:attribute name="role" type="xsd:string" use="required" /><xsd:attribute name="activity-id" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="planned-disbursement"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="period-start"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period-end" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="value" type="currencyType" /><xsd:element name="provider-org" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="provider-activity-id" type="xsd:string" /><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="receiver-org" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="receiver-activity-id" type="xsd:string" /><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="policy-marker"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="vocabulary-uri" type="xsd:anyURI" /><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="significance" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-country"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="percentage" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-region"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="vocabulary-uri" type="xsd:anyURI" /><xsd:attribute name="percentage" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="related-activity"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" use="required" /><xsd:attribute name="type" type="xsd:string" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="reporting-org"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" use="required" /><xsd:attribute name="type" type="xsd:string" use="required" /><xsd:attribute name="secondary-reporter" type="xsd:boolean" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="result"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="title" type="xsd:anyType" /><xsd:element name="description" type="xsd:anyType" minOccurs="0" /><xsd:element name="indicator" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="title" type="xsd:anyType" /><xsd:element name="description" type="xsd:anyType" minOccurs="0" /><xsd:element name="reference" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="vocabulary" type="xsd:string" use="required" /><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="indicator-uri" type="xsd:anyURI" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="baseline" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="comment" type="xsd:anyType" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="year" type="xsd:positiveInteger" use="required" /><xsd:attribute name="value" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="period-start"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period-end"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="target" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="location" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="dimension" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="name" type="xsd:string" /><xsd:attribute name="value" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="comment" type="xsd:anyType" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="value" type="xsd:string" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="actual" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="location" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="dimension" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="name" type="xsd:string" /><xsd:attribute name="value" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="comment" type="xsd:anyType" minOccurs="0" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="value" type="xsd:string" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="measure" type="xsd:string" use="required" /><xsd:attribute name="ascending" type="xsd:boolean" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="type" type="xsd:string" use="required" /><xsd:attribute name="aggregation-status" type="xsd:boolean" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="sector"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="vocabulary-uri" type="xsd:anyURI" /><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="percentage" type="xsd:decimal" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="transaction"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element name="transaction-type"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="transaction-date"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="value" type="currencyType" /><xsd:element name="description" type="textRequiredType" minOccurs="0" /><xsd:element name="provider-org" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="provider-activity-id" type="xsd:string" /><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="receiver-org" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="receiver-activity-id" type="xsd:string" /><xsd:attribute name="type" type="xsd:string" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="disbursement-channel" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="sector" minOccurs="0" maxOccurs="unbounded"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="vocabulary-uri" type="xsd:anyURI" /><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-country" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-region" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" minOccurs="0" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="vocabulary-uri" type="xsd:anyURI" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="flow-type" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="finance-type" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="aid-type" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="tied-status" minOccurs="0"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="code" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="humanitarian" type="xsd:boolean" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:complexType name="textRequiredType"><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:element ref="narrative" maxOccurs="unbounded" /><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema>'
GO
/****** Object:  XmlSchemaCollection [IATISchema].[SchemaCollectionConditions]    Script Date: 20-02-2017 11:25:18 ******/
CREATE XML SCHEMA COLLECTION [IATISchema].[SchemaCollectionConditions] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"><xsd:import namespace="http://www.w3.org/XML/1998/namespace" /><xsd:attribute name="code" type="xsd:string" /><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="type" type="xsd:string" /><xsd:complexType name="currencyType"><xsd:simpleContent><xsd:extension base="xsd:integer"><xsd:attribute name="currency" type="xsd:string" /><xsd:attribute name="value-date" type="xsd:date" use="required" /><xsd:attribute ref="type" /><xsd:anyAttribute namespace="##other" /></xsd:extension></xsd:simpleContent></xsd:complexType><xsd:element name="activity-date"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:attributeGroup ref="textAtts" /><xsd:attribute ref="type" use="required" /><xsd:attribute name="iso-date" type="xsd:date" /><xsd:anyAttribute namespace="##other" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="activity-status" type="codeReqType" /><xsd:element name="activity-website"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:anyURI"><xsd:attribute ref="xml:lang" /><xsd:anyAttribute namespace="##other" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="period-start"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period-end"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute ref="type" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="budget-planned"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element name="receiver-org"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:attribute name="receiver-activity-id" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="description" type="textType" minOccurs="0" /><xsd:element name="period-start" type="dateType" /><xsd:element name="period-end" type="dateType" /><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute ref="type" /><xsd:attribute name="period" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="collaboration-type" type="codeReqType" /><xsd:element name="conditions"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="condition"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" processContents="lax" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute ref="type" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" processContents="lax" /></xsd:choice><xsd:attribute name="attached" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" processContents="lax" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="contact-info"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="organisation" type="xsd:anyType" /><xsd:element name="person-name" type="textType" /><xsd:element name="telephone"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="email" type="plainType" /><xsd:element name="mailing-address"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" /></xsd:choice><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-aid-type" type="codeReqType" /><xsd:element name="default-finance-type" type="codeReqType" /><xsd:element name="default-flow-type" type="codeReqType" /><xsd:element name="default-tied-status" type="codeReqType" /><xsd:element name="description"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attribute ref="type" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="document-link"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element name="title" type="textType" /><xsd:element name="category" type="codeReqType" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="url" type="xsd:anyURI" use="required" /><xsd:attribute name="format" type="xsd:string" /><xsd:attribute name="language" type="xsd:language" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-activities"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element ref="iati-activity" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="version" type="xsd:decimal" /><xsd:attribute name="generated-datetime" type="xsd:dateTime" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-activity"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element ref="activity-website" /><xsd:element ref="reporting-org" /><xsd:element ref="participating-org" /><xsd:element ref="recipient-country" /><xsd:element ref="recipient-region" /><xsd:element ref="collaboration-type" /><xsd:element ref="default-flow-type" /><xsd:element ref="default-aid-type" /><xsd:element ref="default-finance-type" /><xsd:element ref="iati-identifier" /><xsd:element ref="other-identifier" /><xsd:element ref="title" /><xsd:element ref="description" /><xsd:element ref="sector" /><xsd:element ref="activity-date" /><xsd:element ref="activity-status" /><xsd:element ref="contact-info" /><xsd:element ref="default-tied-status" /><xsd:element ref="policy-marker" /><xsd:element ref="location" /><xsd:element ref="total-cost" /><xsd:element ref="budget-planned" /><xsd:element ref="transaction" /><xsd:element ref="budget" /><xsd:element ref="related-initiative" /><xsd:element ref="related-activity" /><xsd:element ref="document-link" /><xsd:element ref="conditions" /><xsd:element ref="legacy-data" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="version" type="xsd:decimal" /><xsd:attribute name="last-updated-datetime" type="xsd:dateTime" /><xsd:attribute ref="xml:lang" /><xsd:attribute name="default-currency" type="xsd:string" /><xsd:attribute name="hierarchy" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-identifier"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-organisation"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element ref="organisation-website" /><xsd:element ref="iati-identifier" /><xsd:element ref="name" /><xsd:element ref="total-budget" /><xsd:element ref="recipient-org-budget" /><xsd:element ref="recipient-country-budget" /><xsd:element ref="document-link" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="version" type="xsd:decimal" /><xsd:attribute name="last-updated-datetime" type="xsd:dateTime" /><xsd:attribute ref="xml:lang" /><xsd:attribute name="default-currency" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="legacy-data"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="name" type="xsd:string" use="required" /><xsd:attribute name="value" type="xsd:string" use="required" /><xsd:attribute name="iati-equivalent" type="xsd:NMTOKEN" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="location"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="location-type" type="codeReqType" /><xsd:element name="name" type="textType" /><xsd:element name="description" type="textType" /><xsd:element name="administrative"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="country" type="xsd:string" /><xsd:attribute name="adm1" type="xsd:string" /><xsd:attribute name="adm2" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="coordinates"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="latitude" type="xsd:decimal" use="required" /><xsd:attribute name="longitude" type="xsd:decimal" use="required" /><xsd:attribute name="precision" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="gazetteer-entry"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="gazetteer-ref" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="percentage" type="xsd:positiveInteger" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="name"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:attributeGroup ref="textAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="organisation-website"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:anyURI"><xsd:attribute ref="xml:lang" /><xsd:anyAttribute namespace="##other" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="other-identifier"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:attribute name="owner-ref" type="xsd:string" /><xsd:attribute name="owner-name" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="participating-org"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:attribute name="role" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="policy-marker"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="codeReqAtts" /><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="significance" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-country"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="codeAtts" /><xsd:attributeGroup ref="textAtts" /><xsd:attribute name="percentage" type="xsd:positiveInteger" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-country-budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="recipient-country" type="refType" /><xsd:element name="period-start" type="dateType" /><xsd:element name="period-end" type="dateType" /><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-org-budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="recipient-org" type="refType" /><xsd:element name="period-start" type="dateType" /><xsd:element name="period-end" type="dateType" /><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-region"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="codeAtts" /><xsd:attributeGroup ref="textAtts" /><xsd:attribute name="percentage" type="xsd:positiveInteger" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="related-activity"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attribute ref="ref" use="required" /><xsd:attribute ref="type" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="related-initiative" type="refType" /><xsd:element name="reporting-org" type="refType" /><xsd:element name="sector"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="codeAtts" /><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="percentage" type="xsd:positiveInteger" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="title" type="textType" /><xsd:element name="total-budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="period-start" type="dateType" /><xsd:element name="period-end" type="dateType" /><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="total-cost" type="currencyType" /><xsd:element name="transaction"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element name="value" type="currencyType" /><xsd:element name="transaction-type" type="codeType" /><xsd:element name="status" type="codeType" /><xsd:element name="provider-org"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:attribute name="provider-activity-id" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="receiver-org"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:attribute name="receiver-activity-id" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="provider-activity" type="refType" /><xsd:element name="receiver-activity" type="refType" /><xsd:element name="description" type="textType" minOccurs="0" /><xsd:element name="transaction-date"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="flow-type" type="codeReqType" /><xsd:element name="aid-type" type="codeReqType" /><xsd:element name="finance-type" type="codeReqType" /><xsd:element name="tied-status" type="codeReqType" /><xsd:element name="disbursement-channel" type="codeReqType" /><xsd:any namespace="##other" /></xsd:choice><xsd:attributeGroup ref="refAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:attributeGroup name="codeAtts"><xsd:attribute ref="code" /><xsd:attribute ref="type" /></xsd:attributeGroup><xsd:attributeGroup name="codeReqAtts"><xsd:attribute ref="code" use="required" /><xsd:attribute ref="type" /></xsd:attributeGroup><xsd:attributeGroup name="refAtts"><xsd:attribute ref="ref" /><xsd:attribute ref="type" /></xsd:attributeGroup><xsd:attributeGroup name="textAtts"><xsd:attribute ref="xml:lang" /></xsd:attributeGroup><xsd:complexType name="codeReqType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="codeReqAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="codeType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="codeAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="dateType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="plainType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="refType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="textType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://iatiregistry.org/ns/record#" targetNamespace="http://iatiregistry.org/ns/record#"><xsd:import namespace="http://www.w3.org/XML/1998/namespace" /><xsd:element name="registry-record"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="##other" /></xsd:choice><xsd:attribute ref="xml:lang" /><xsd:attribute name="file-id" type="xsd:string" use="required" /><xsd:attribute name="source-url" type="xsd:anyURI" use="required" /><xsd:attribute name="publisher-id" type="xsd:string" use="required" /><xsd:attribute name="publisher-role" type="xsd:string" use="required" /><xsd:attribute name="contact-email" type="xsd:string" /><xsd:attribute name="donor-id" type="xsd:string" /><xsd:attribute name="donor-type" type="xsd:string" /><xsd:attribute name="donor-country" type="xsd:string" /><xsd:attribute name="title" type="xsd:string" use="required" /><xsd:attribute name="activity-period" type="xsd:string" /><xsd:attribute name="last-updated-datetime" type="xsd:dateTime" use="required" /><xsd:attribute name="generated-datetime" type="xsd:dateTime" use="required" /><xsd:attribute name="verification-status" type="xsd:string" use="required" /><xsd:attribute name="format" type="xsd:string" use="required" /><xsd:attribute name="license" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema>'
GO
/****** Object:  XmlSchemaCollection [IATISchema].[SchemaCollectionPreConditions]    Script Date: 20-02-2017 11:25:18 ******/
CREATE XML SCHEMA COLLECTION [IATISchema].[SchemaCollectionPreConditions] AS N'<xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema"><xsd:import namespace="http://www.w3.org/XML/1998/namespace" /><xsd:attribute name="code" type="xsd:string" /><xsd:attribute name="ref" type="xsd:string" /><xsd:attribute name="type" type="xsd:string" /><xsd:complexType name="currencyType"><xsd:simpleContent><xsd:extension base="xsd:integer"><xsd:attribute name="currency" type="xsd:string" /><xsd:attribute name="value-date" type="xsd:date" use="required" /><xsd:attribute ref="type" /><xsd:anyAttribute namespace="##other" /></xsd:extension></xsd:simpleContent></xsd:complexType><xsd:element name="activity-date"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:string"><xsd:attributeGroup ref="textAtts" /><xsd:attribute ref="type" use="required" /><xsd:attribute name="iso-date" type="xsd:date" /><xsd:anyAttribute namespace="##other" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="activity-status" type="codeReqType" /><xsd:element name="activity-website"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:anyURI"><xsd:attribute ref="xml:lang" /><xsd:anyAttribute namespace="##other" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="period-start"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="period-end"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute ref="type" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="budget-planned"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element name="receiver-org"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:attribute name="receiver-activity-id" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="description" type="textType" minOccurs="0" /><xsd:element name="period-start" type="dateType" /><xsd:element name="period-end" type="dateType" /><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute ref="type" /><xsd:attribute name="period" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="collaboration-type" type="codeReqType" /><xsd:element name="contact-info"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="organisation" type="xsd:anyType" /><xsd:element name="person-name" type="textType" /><xsd:element name="telephone"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="email" type="plainType" /><xsd:element name="mailing-address"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" /></xsd:choice><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="default-aid-type" type="codeReqType" /><xsd:element name="default-finance-type" type="codeReqType" /><xsd:element name="default-flow-type" type="codeReqType" /><xsd:element name="default-tied-status" type="codeReqType" /><xsd:element name="description"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attribute ref="type" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="document-link"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element name="title" type="textType" /><xsd:element name="category" type="codeReqType" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="url" type="xsd:anyURI" use="required" /><xsd:attribute name="format" type="xsd:string" /><xsd:attribute name="language" type="xsd:language" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-activities"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element ref="iati-activity" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="version" type="xsd:decimal" /><xsd:attribute name="generated-datetime" type="xsd:dateTime" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-activity"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element ref="activity-website" /><xsd:element ref="reporting-org" /><xsd:element ref="participating-org" /><xsd:element ref="recipient-country" /><xsd:element ref="recipient-region" /><xsd:element ref="collaboration-type" /><xsd:element ref="default-flow-type" /><xsd:element ref="default-aid-type" /><xsd:element ref="default-finance-type" /><xsd:element ref="iati-identifier" /><xsd:element ref="other-identifier" /><xsd:element ref="title" /><xsd:element ref="description" /><xsd:element ref="sector" /><xsd:element ref="activity-date" /><xsd:element ref="activity-status" /><xsd:element ref="contact-info" /><xsd:element ref="default-tied-status" /><xsd:element ref="policy-marker" /><xsd:element ref="location" /><xsd:element ref="total-cost" /><xsd:element ref="budget-planned" /><xsd:element ref="transaction" /><xsd:element ref="budget" /><xsd:element ref="related-initiative" /><xsd:element ref="related-activity" /><xsd:element ref="document-link" /><xsd:element ref="legacy-data" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="version" type="xsd:decimal" /><xsd:attribute name="last-updated-datetime" type="xsd:dateTime" /><xsd:attribute ref="xml:lang" /><xsd:attribute name="default-currency" type="xsd:string" /><xsd:attribute name="hierarchy" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-identifier"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="iati-organisation"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element ref="organisation-website" /><xsd:element ref="iati-identifier" /><xsd:element ref="name" /><xsd:element ref="total-budget" /><xsd:element ref="recipient-org-budget" /><xsd:element ref="recipient-country-budget" /><xsd:element ref="document-link" /><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="version" type="xsd:decimal" /><xsd:attribute name="last-updated-datetime" type="xsd:dateTime" /><xsd:attribute ref="xml:lang" /><xsd:attribute name="default-currency" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="legacy-data"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="name" type="xsd:string" use="required" /><xsd:attribute name="value" type="xsd:string" use="required" /><xsd:attribute name="iati-equivalent" type="xsd:NMTOKEN" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="location"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="location-type" type="codeReqType" /><xsd:element name="name" type="textType" /><xsd:element name="description" type="textType" /><xsd:element name="administrative"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="country" type="xsd:string" /><xsd:attribute name="adm1" type="xsd:string" /><xsd:attribute name="adm2" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="coordinates"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="latitude" type="xsd:decimal" use="required" /><xsd:attribute name="longitude" type="xsd:decimal" use="required" /><xsd:attribute name="precision" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="gazetteer-entry"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="gazetteer-ref" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:any namespace="##other" /></xsd:choice><xsd:attribute name="percentage" type="xsd:positiveInteger" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="name"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:attributeGroup ref="textAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="organisation-website"><xsd:complexType><xsd:simpleContent><xsd:extension base="xsd:anyURI"><xsd:attribute ref="xml:lang" /><xsd:anyAttribute namespace="##other" /></xsd:extension></xsd:simpleContent></xsd:complexType></xsd:element><xsd:element name="other-identifier"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:attribute name="owner-ref" type="xsd:string" /><xsd:attribute name="owner-name" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="participating-org"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:attribute name="role" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="policy-marker"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="codeReqAtts" /><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="significance" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-country"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="codeAtts" /><xsd:attributeGroup ref="textAtts" /><xsd:attribute name="percentage" type="xsd:positiveInteger" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-country-budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="recipient-country" type="refType" /><xsd:element name="period-start" type="dateType" /><xsd:element name="period-end" type="dateType" /><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-org-budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="recipient-org" type="refType" /><xsd:element name="period-start" type="dateType" /><xsd:element name="period-end" type="dateType" /><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="recipient-region"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="codeAtts" /><xsd:attributeGroup ref="textAtts" /><xsd:attribute name="percentage" type="xsd:positiveInteger" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="related-activity"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attribute ref="ref" use="required" /><xsd:attribute ref="type" use="required" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="related-initiative" type="refType" /><xsd:element name="reporting-org" type="refType" /><xsd:element name="sector"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="codeAtts" /><xsd:attribute name="vocabulary" type="xsd:string" /><xsd:attribute name="percentage" type="xsd:positiveInteger" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="title" type="textType" /><xsd:element name="total-budget"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:element name="period-start" type="dateType" /><xsd:element name="period-end" type="dateType" /><xsd:element name="value" type="currencyType" /><xsd:any namespace="##other" /></xsd:choice><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="total-cost" type="currencyType" /><xsd:element name="transaction"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice maxOccurs="unbounded"><xsd:element name="value" type="currencyType" /><xsd:element name="transaction-type" type="codeType" /><xsd:element name="status" type="codeType" /><xsd:element name="provider-org"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:attribute name="provider-activity-id" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="receiver-org"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:attribute name="receiver-activity-id" type="xsd:string" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="provider-activity" type="refType" /><xsd:element name="receiver-activity" type="refType" /><xsd:element name="description" type="textType" minOccurs="0" /><xsd:element name="transaction-date"><xsd:complexType mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:element name="flow-type" type="codeReqType" /><xsd:element name="aid-type" type="codeReqType" /><xsd:element name="finance-type" type="codeReqType" /><xsd:element name="tied-status" type="codeReqType" /><xsd:element name="disbursement-channel" type="codeReqType" /><xsd:any namespace="##other" /></xsd:choice><xsd:attributeGroup ref="refAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element><xsd:attributeGroup name="codeAtts"><xsd:attribute ref="code" /><xsd:attribute ref="type" /></xsd:attributeGroup><xsd:attributeGroup name="codeReqAtts"><xsd:attribute ref="code" use="required" /><xsd:attribute ref="type" /></xsd:attributeGroup><xsd:attributeGroup name="refAtts"><xsd:attribute ref="ref" /><xsd:attribute ref="type" /></xsd:attributeGroup><xsd:attributeGroup name="textAtts"><xsd:attribute ref="xml:lang" /></xsd:attributeGroup><xsd:complexType name="codeReqType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="codeReqAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="codeType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="codeAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="dateType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attribute name="iso-date" type="xsd:date" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="plainType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="refType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:attributeGroup ref="refAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType><xsd:complexType name="textType" mixed="true"><xsd:complexContent mixed="true"><xsd:restriction base="xsd:anyType"><xsd:sequence><xsd:any namespace="##other" minOccurs="0" maxOccurs="unbounded" /></xsd:sequence><xsd:attributeGroup ref="textAtts" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:schema><xsd:schema xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:t="http://iatiregistry.org/ns/record#" targetNamespace="http://iatiregistry.org/ns/record#"><xsd:import namespace="http://www.w3.org/XML/1998/namespace" /><xsd:element name="registry-record"><xsd:complexType><xsd:complexContent><xsd:restriction base="xsd:anyType"><xsd:choice minOccurs="0" maxOccurs="unbounded"><xsd:any namespace="##other" /></xsd:choice><xsd:attribute ref="xml:lang" /><xsd:attribute name="file-id" type="xsd:string" use="required" /><xsd:attribute name="source-url" type="xsd:anyURI" use="required" /><xsd:attribute name="publisher-id" type="xsd:string" use="required" /><xsd:attribute name="publisher-role" type="xsd:string" use="required" /><xsd:attribute name="contact-email" type="xsd:string" /><xsd:attribute name="donor-id" type="xsd:string" /><xsd:attribute name="donor-type" type="xsd:string" /><xsd:attribute name="donor-country" type="xsd:string" /><xsd:attribute name="title" type="xsd:string" use="required" /><xsd:attribute name="activity-period" type="xsd:string" /><xsd:attribute name="last-updated-datetime" type="xsd:dateTime" use="required" /><xsd:attribute name="generated-datetime" type="xsd:dateTime" use="required" /><xsd:attribute name="verification-status" type="xsd:string" use="required" /><xsd:attribute name="format" type="xsd:string" use="required" /><xsd:attribute name="license" type="xsd:string" use="required" /><xsd:anyAttribute namespace="##other" /></xsd:restriction></xsd:complexContent></xsd:complexType></xsd:element></xsd:schema>'
GO
/****** Object:  UserDefinedDataType [Configuration].[Flag]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [Configuration].[Flag] FROM [char](1) NOT NULL
GO
/****** Object:  UserDefinedDataType [Configuration].[Version]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [Configuration].[Version] FROM [int] NOT NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xml:lang]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xml:lang] FROM [nchar](2) NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xsd:anyURI]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xsd:anyURI] FROM [nvarchar](max) NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xsd:date]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xsd:date] FROM [datetime] NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xsd:datetime]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xsd:datetime] FROM [datetime] NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xsd:decimal]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xsd:decimal] FROM [decimal](36, 18) NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xsd:integer]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xsd:integer] FROM [bigint] NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xsd:language]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xsd:language] FROM [nchar](2) NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xsd:NMTOKEN]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xsd:NMTOKEN] FROM [nvarchar](max) NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xsd:positiveInteger]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xsd:positiveInteger] FROM [bigint] NULL
GO
/****** Object:  UserDefinedDataType [IATISchema].[xsd:string]    Script Date: 20-02-2017 11:25:18 ******/
CREATE TYPE [IATISchema].[xsd:string] FROM [nvarchar](max) NULL
GO
/****** Object:  UserDefinedFunction [Configuration].[f_CurrentVersion]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [Configuration].[f_CurrentVersion]()
RETURNS Configuration.Version
AS
BEGIN
	RETURN (SELECT MAX(VersionId) FROM [ProjectDataMart].Configuration.Version WHERE EndDateTime IS NOT NULL)
END





GO
/****** Object:  UserDefinedFunction [Configuration].[f_MakeDate]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

	
CREATE FUNCTION [Configuration].[f_MakeDate]
(
	@Year INT,
	@Month INT,
	@Day INT
)
RETURNS DATETIME
BEGIN
	DECLARE @DateAsString VARCHAR(MAX)
	
	SET @DateAsString =
		REPLACE(STR(@Year, 4), ' ', '0') +
		REPLACE(STR(@Month, 2), ' ', '0') +
		REPLACE(STR(@Day, 2), ' ', '0')
	
	RETURN CASE WHEN ISDATE(@DateAsString) = 1 THEN @DateAsString END
END


GO
/****** Object:  UserDefinedFunction [IATISchema].[f_ActivitiesRegistryRecord]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [IATISchema].[f_ActivitiesRegistryRecord]
(
	@ActivitiesID	INT
	,@URI			IATISchema.[xsd:anyURI]
)
RETURNS
	XML
BEGIN
	DECLARE @XML XML;

	WITH
		XMLNAMESPACES ('http://iatiregistry.org/ns/record#' AS ir),
		--XMLNAMESPACES (DEFAULT 'http://iatiregistry.org/ns/record#'),
		XML (XML) AS
	(
		SELECT
			[ir:registry-record/@xml:lang]
			,[ir:registry-record/@file-id]
			,@URI AS [ir:registry-record/@source-url]
			,[ir:registry-record/@publisher-id]
			,[ir:registry-record/@publisher-role]
			,[ir:registry-record/@contact-email]
			,[ir:registry-record/@donor-id]
			,[ir:registry-record/@donor-type]
			,[ir:registry-record/@donor-country]
			,[ir:registry-record/@title]
			,[ir:registry-record/@activity-period]
			,IATISchema.FormatXSDDateTime([ir:registry-record/@last-updated-datetime]) AS [ir:registry-record/@last-updated-datetime]
			,IATISchema.FormatXSDDateTime(ISNULL([ir:registry-record/@generated-datetime], GETDATE())) AS [ir:registry-record/@generated-datetime]
			,[ir:registry-record/@verification-status]
			,[ir:registry-record/@format]
			,[ir:registry-record/@license]

--			[ir:registry-record/@xml:lang] AS [@xml:lang]
--			,[ir:registry-record/@file-id] AS [@file-id]
--			,[ir:registry-record/@source-url] AS [@source-url]
--			,[ir:registry-record/@publisher-id] AS [@publisher-id]
--			,[ir:registry-record/@publisher-role] AS [@publisher-role]
--			,[ir:registry-record/@contact-email] AS [@contact-email]
--			,[ir:registry-record/@donor-id] AS [@donor-id]
--			,[ir:registry-record/@donor-type] AS [@donor-type]
--			,[ir:registry-record/@donor-country] AS [@donor-country]
--			,[ir:registry-record/@title] AS [@title]
--			,[ir:registry-record/@activity-period] AS [@activity-period]
--			,IATISchema.FormatXSDDateTime([ir:registry-record/@last-updated-datetime]) AS [@last-updated-datetime]
--			,IATISchema.FormatXSDDateTime([ir:registry-record/@generated-datetime]) AS [@generated-datetime]
--			,[ir:registry-record/@verification-status] AS [@verification-status]
--			,[ir:registry-record/@format] AS [@format]
--			,[ir:registry-record/@license] AS [@license]
		FROM
			IATISchema.[iati-activities]
		FOR XML PATH (''), TYPE
	)
	SELECT @XML = XML FROM XML

	RETURN @XML
END

--SELECT IATISchema.f_ActivitiesRegistryRecord(101, 'http://projects.dfid.gov.uk/test.xml')
--
--SELECT * FROM IATISchema.[iati-activities]--



GO
/****** Object:  UserDefinedFunction [IATISchema].[f_ActivityActualEndDate]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [IATISchema].[f_ActivityActualEndDate]
(
	@IATIActivityId int
)
RETURNS DATETIME
AS
BEGIN
	DECLARE @Return as DATETIME
	
	Select  @Return = [@iso-date] From [IATISchema].[activity-date] Where [iati-activityID] = @IATIActivityId AND [@type] = '4'

	RETURN @Return
END



GO
/****** Object:  UserDefinedFunction [IATISchema].[f_ActivityActualStartDate]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE FUNCTION [IATISchema].[f_ActivityActualStartDate]
(
	@IATIActivityId int
)
RETURNS DATETIME
AS
BEGIN
	DECLARE @Return as DATETIME
	
	Select  @Return = [@iso-date] From [IATISchema].[activity-date] Where [iati-activityID] = @IATIActivityId AND [@type] = '2'

	RETURN @Return
END



GO
/****** Object:  UserDefinedFunction [IATISchema].[f_OrganisationRegistryRecord]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [IATISchema].[f_OrganisationRegistryRecord]
(
	@OrganisationID	INT
	,@URI			IATISchema.[xsd:anyURI]
)
RETURNS
	XML
BEGIN
	DECLARE @XML XML;

	WITH
		XMLNAMESPACES ('http://iatiregistry.org/ns/record#' AS ir),
		--XMLNAMESPACES (DEFAULT 'http://iatiregistry.org/ns/record#'),
		XML (XML) AS
	(
		SELECT
			[ir:registry-record/@xml:lang]
			,[ir:registry-record/@file-id]
			,ISNULL(@URI, [ir:registry-record/@source-url]) AS [ir:registry-record/@source-url]
			,[ir:registry-record/@publisher-id]
			,[ir:registry-record/@publisher-role]
			,[ir:registry-record/@contact-email]
			,[ir:registry-record/@donor-id]
			,[ir:registry-record/@donor-type]
			,[ir:registry-record/@donor-country]
			,[ir:registry-record/@title]
			,[ir:registry-record/@activity-period]
			,IATISchema.FormatXSDDateTime([ir:registry-record/@last-updated-datetime]) AS [ir:registry-record/@last-updated-datetime]
			,IATISchema.FormatXSDDateTime(ISNULL([ir:registry-record/@generated-datetime], GETDATE())) AS [ir:registry-record/@generated-datetime]
			,[ir:registry-record/@verification-status]
			,[ir:registry-record/@format]
			,[ir:registry-record/@license]

--			[ir:registry-record/@xml:lang] AS [@xml:lang]
--			,[ir:registry-record/@file-id] AS [@file-id]
--			,[ir:registry-record/@source-url] AS [@source-url]
--			,[ir:registry-record/@publisher-id] AS [@publisher-id]
--			,[ir:registry-record/@publisher-role] AS [@publisher-role]
--			,[ir:registry-record/@contact-email] AS [@contact-email]
--			,[ir:registry-record/@donor-id] AS [@donor-id]
--			,[ir:registry-record/@donor-type] AS [@donor-type]
--			,[ir:registry-record/@donor-country] AS [@donor-country]
--			,[ir:registry-record/@title] AS [@title]
--			,[ir:registry-record/@activity-period] AS [@activity-period]
--			,IATISchema.FormatXSDDateTime([ir:registry-record/@last-updated-datetime]) AS [@last-updated-datetime]
--			,IATISchema.FormatXSDDateTime([ir:registry-record/@generated-datetime]) AS [@generated-datetime]
--			,[ir:registry-record/@verification-status] AS [@verification-status]
--			,[ir:registry-record/@format] AS [@format]
--			,[ir:registry-record/@license] AS [@license]
		FROM
			IATISchema.[iati-organisation]
		WHERE
			[iati-organisationID] = @OrganisationID
		FOR XML PATH (''), TYPE
	)
	SELECT @XML = XML FROM XML

	RETURN @XML
END--



GO
/****** Object:  UserDefinedFunction [IATISchema].[FormatXSDDate]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [IATISchema].[FormatXSDDate]
(
      @Date [xsd:date]
)
RETURNS
	CHAR(10)
BEGIN
	RETURN CONVERT(CHAR(10), @Date, 126)
END






GO
/****** Object:  UserDefinedFunction [IATISchema].[FormatXSDDateTime]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--DROP FUNCTION [IATISchema].[FormatXSDDateTime]


CREATE FUNCTION [IATISchema].[FormatXSDDateTime]
(
	@Date [xsd:dateTime]
)
RETURNS
	CHAR(25)
BEGIN
	RETURN CONVERT(CHAR(19), @Date, 127) --+ '+00:00'
END




GO
/****** Object:  UserDefinedFunction [PublicationControl].[f_HasBudgetSupport]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [PublicationControl].[f_HasBudgetSupport]
(
	@ProjectId varchar(25)
)
RETURNS INT
AS
BEGIN
	DECLARE @Count  as INT
	DECLARE @Return as INT
	
	select @Count = COUNT(*) 
	from [ProjectDataMart].[AgressoTransformation].ComponentTransformed
	where ProjectId = @ProjectId
	and FundingTypeCode in ('GENBUDGETSUPPORT', 'SECTORBUDGETSUPPORT', 'NONBUDGETSUPPFINAID')

	SELECT @Return = 
		CASE 
			WHEN @Count >0 THEN 1
			ELSE 0
		END 
	
	RETURN @Return
END


GO
/****** Object:  UserDefinedFunction [PublicationControl].[f_HasSpecificConditions]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




CREATE FUNCTION [PublicationControl].[f_HasSpecificConditions]
(
	@ProjectId varchar(25)
)
RETURNS INT
AS
BEGIN
	DECLARE @Count  as INT
	DECLARE @Return as INT
	
	select @Count = COUNT(*) 
	from [ProjectDataMart].[AgressoTransformation].ProjectTransformed
	where ProjectId = @ProjectId
	and SpecificConditions like 'Yes%'
	
	SELECT @Return = 
		CASE 
			WHEN @Count >0 THEN 1
			ELSE 0
		END 
	
	RETURN @Return
END






GO
/****** Object:  UserDefinedFunction [PublicationControl].[f_Quarter]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE FUNCTION [PublicationControl].[f_Quarter]
(
	@DateTime DATETIME
)
RETURNS
	CHAR(6)
AS
BEGIN
	RETURN
		STR(((DATEPART(QUARTER, @DateTime) + 2) % 4) + 1, 1) + ' ' +
		STR(YEAR(@DateTime) + CASE ((DATEPART(QUARTER, @DateTime) + 2) % 4) + 1 WHEN 4 THEN -1 ELSE 0 END, 4)
END

--SELECT IATI.f_Quarter(Configuration.f_MakeDate(2011, 3, 31))--




GO
/****** Object:  UserDefinedFunction [PublicationControl].[f_QuarterValue]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





CREATE FUNCTION [PublicationControl].[f_QuarterValue]
(
	@DateTime DATETIME
)
RETURNS
	INT
AS
BEGIN
	RETURN
		((DATEPART(QUARTER, @DateTime) + 2) % 4) + 1 
END






GO
/****** Object:  Table [IATISchema].[iati-activities]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[iati-activities](
	[iati-activitiesID] [int] NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Notes] [nvarchar](max) NULL,
	[@version] [IATISchema].[xsd:decimal] NULL,
	[@generated-datetime] [IATISchema].[xsd:datetime] NULL,
	[ir:registry-record/@xml:lang] [IATISchema].[xml:lang] NULL,
	[ir:registry-record/@file-id] [IATISchema].[xsd:string] NOT NULL,
	[ir:registry-record/@source-url] [IATISchema].[xsd:anyURI] NOT NULL,
	[ir:registry-record/@publisher-id] [nvarchar](255) NOT NULL,
	[ir:registry-record/@publisher-role] [nvarchar](255) NOT NULL,
	[ir:registry-record/@contact-email] [IATISchema].[xsd:string] NULL,
	[ir:registry-record/@donor-id] [nvarchar](255) NOT NULL,
	[ir:registry-record/@donor-type] [int] NOT NULL,
	[ir:registry-record/@donor-country] [nchar](2) NULL,
	[ir:registry-record/@title] [IATISchema].[xsd:string] NOT NULL,
	[ir:registry-record/@activity-period] [IATISchema].[xsd:string] NULL,
	[ir:registry-record/@last-updated-datetime] [IATISchema].[xsd:datetime] NOT NULL,
	[ir:registry-record/@generated-datetime] [IATISchema].[xsd:datetime] NOT NULL,
	[ir:registry-record/@verification-status] [int] NOT NULL,
	[ir:registry-record/@format] [nvarchar](255) NOT NULL,
	[ir:registry-record/@license] [IATISchema].[xsd:string] NOT NULL,
 CONSTRAINT [iati-activities$pk] PRIMARY KEY CLUSTERED 
(
	[iati-activitiesID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[Region]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[Region](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [Region$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Region$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[other-identifier]    Script Date: 20-02-2017 11:25:18 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[other-identifier](
	[Id] [int] IDENTITY(1,1) NOT FOR REPLICATION NOT NULL,
	[iati-activitiesId] [int] NOT NULL,
	[ActivityId] [int] NOT NULL,
	[@owner-ref] [nvarchar](255) NULL,
	[@owner-name] [IATISchema].[xsd:string] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
	[ProjectId] [nvarchar](255) NULL,
	[@type] [nvarchar](50) NULL,
 CONSTRAINT [other-identifier$pk] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[TiedStatus]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[TiedStatus](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [TiedStatus$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [TiedStatus$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[TransactionType]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[TransactionType](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [TransactionType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [TransactionType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[activity/description]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[activity/description](
	[activity/descriptionID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@type] [nvarchar](255) NULL,
	[text()] [IATISchema].[xsd:string] NOT NULL,
 CONSTRAINT [activity/description$pk] PRIMARY KEY CLUSTERED 
(
	[activity/descriptionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[activity/title]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[activity/title](
	[activity/titleID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[text()] [IATISchema].[xsd:string] NOT NULL,
 CONSTRAINT [activity/title$pk] PRIMARY KEY CLUSTERED 
(
	[activity/titleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[activity-date]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[activity-date](
	[activity-dateID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@type] [nvarchar](255) NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@iso-date] [IATISchema].[xsd:date] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [activity-date$pk] PRIMARY KEY CLUSTERED 
(
	[activity-dateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[budget]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[budget](
	[budgetID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@type] [nvarchar](255) NULL,
	[period-start/@iso-date] [IATISchema].[xsd:date] NOT NULL,
	[period-start/text()] [IATISchema].[xsd:string] NULL,
	[period-end/@iso-date] [IATISchema].[xsd:date] NOT NULL,
	[period-end/text()] [IATISchema].[xsd:string] NULL,
	[value/@currency] [nchar](3) NULL,
	[value/@value-date] [IATISchema].[xsd:date] NOT NULL,
	[value/text()] [IATISchema].[xsd:integer] NOT NULL,
 CONSTRAINT [budget$pk] PRIMARY KEY CLUSTERED 
(
	[budgetID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[capital-spend]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[capital-spend](
	[capital-spendID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@percentage] [IATISchema].[xsd:positiveInteger] NULL,
 CONSTRAINT [capital-spend$pk] PRIMARY KEY CLUSTERED 
(
	[capital-spendID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[conditions]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[conditions](
	[conditionsID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@attached] [int] NOT NULL,
	[condtionFlag] [nvarchar](1) NULL,
 CONSTRAINT [conditions$pk] PRIMARY KEY CLUSTERED 
(
	[conditionsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[conditions/condition]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[conditions/condition](
	[conditions/conditionID] [int] IDENTITY(1,1) NOT NULL,
	[conditionsID] [int] NOT NULL,
	[@type] [int] NOT NULL,
	[text()] [IATISchema].[xsd:string] NOT NULL,
 CONSTRAINT [conditions/condition$pk] PRIMARY KEY CLUSTERED 
(
	[conditions/conditionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[contact-info]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[contact-info](
	[contact-infoID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[organisation/text()] [IATISchema].[xsd:string] NULL,
	[person-name/@xml:lang] [IATISchema].[xml:lang] NULL,
	[person-name/text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [contact-info$pk] PRIMARY KEY CLUSTERED 
(
	[contact-infoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[ActivityStatus]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[ActivityStatus](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[NameUM] [nvarchar](255) NULL,
 CONSTRAINT [ActivityStatus$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ActivityStatus$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[contact-info/details]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[contact-info/details](
	[contact-info/detailsID] [int] IDENTITY(1,1) NOT NULL,
	[contact-infoID] [int] NOT NULL,
	[telephone/text()] [IATISchema].[xsd:string] NULL,
	[email/text()] [IATISchema].[xsd:string] NULL,
	[mailing-address/text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [contact-info/details$pk] PRIMARY KEY CLUSTERED 
(
	[contact-info/detailsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[result/indicator/description]    Script Date: 20-02-2017 11:25:19 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[result/indicator/description](
	[Id] [int] NOT NULL,
	[result/indicatorId] [int] NOT NULL,
	[@type] [int] NULL,
	[@xml:lang] [nchar](2) NULL,
	[text()] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[AidType]    Script Date: 20-02-2017 11:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[AidType](
	[Code] [nchar](3) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryCode] [nchar](1) NOT NULL,
 CONSTRAINT [AidType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AidType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[country-budget-items]    Script Date: 20-02-2017 11:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[country-budget-items](
	[country-budget-itemsID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@vocabulary] [nvarchar](255) NOT NULL,
 CONSTRAINT [country-budget-items$pk] PRIMARY KEY CLUSTERED 
(
	[country-budget-itemsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[result/indicator/title]    Script Date: 20-02-2017 11:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[result/indicator/title](
	[Id] [int] NOT NULL,
	[result/indicatorId] [int] NOT NULL,
	[@xml:lang] [nchar](2) NULL,
	[text()] [nvarchar](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[result/title]    Script Date: 20-02-2017 11:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[result/title](
	[Id] [int] NOT NULL,
	[resultId] [int] NOT NULL,
	[@xml:lang] [nchar](2) NULL,
	[text()] [nvarchar](max) NULL,
 CONSTRAINT [PK_result/title] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[country-budget-items/budget-item]    Script Date: 20-02-2017 11:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[country-budget-items/budget-item](
	[country-budget-items/budget-itemID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@code] [nvarchar](10) NOT NULL,
	[@percentage] [IATISchema].[xsd:positiveInteger] NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [country-budget-items/budget-item$pk] PRIMARY KEY CLUSTERED 
(
	[country-budget-items/budget-itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[result/indicator]    Script Date: 20-02-2017 11:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[result/indicator](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[resultId] [int] NOT NULL,
	[@measure] [int] NOT NULL,
	[title/@xml:lang] [nchar](2) NULL,
	[title/text()] [nvarchar](max) NULL,
	[description/@type] [int] NULL,
	[description/@xml:lang] [nchar](2) NULL,
	[description/text()] [nvarchar](max) NULL,
	[baseline/@year] [nvarchar](max) NULL,
	[baseline/@value] [nvarchar](max) NULL,
	[baseline/@xml:lang] [nchar](2) NULL,
	[baseline/text()] [nvarchar](max) NULL,
	[@ascending] [bit] NULL,
	[pdb_indicatorId] [int] NULL,
 CONSTRAINT [PK_result/indicator] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[iati-activity]    Script Date: 20-02-2017 11:25:20 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[iati-activity](
	[iati-activityID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activitiesID] [int] NOT NULL,
	[ProjectId] [varchar](25) NOT NULL,
	[ComponentId] [varchar](25) NULL,
	[BenefittingCountryCode] [varchar](25) NULL,
	[CountryCode] [nchar](2) NULL,
	[RegionCode] [int] NULL,
	[@version] [IATISchema].[xsd:decimal] NULL,
	[@last-updated-datetime] [IATISchema].[xsd:datetime] NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@default-currency] [nchar](3) NULL,
	[@hierarchy] [IATISchema].[xsd:string] NULL,
	[reporting-org/@xml:lang] [IATISchema].[xml:lang] NULL,
	[reporting-org/@ref] [nvarchar](255) NULL,
	[reporting-org/@type] [int] NULL,
	[reporting-org/text()] [IATISchema].[xsd:string] NULL,
	[collaboration-type/@xml:lang] [IATISchema].[xml:lang] NULL,
	[collaboration-type/@code] [int] NULL,
	[collaboration-type/@type] [IATISchema].[xsd:string] NULL,
	[collaboration-type/text()] [IATISchema].[xsd:string] NULL,
	[default-flow-type/@xml:lang] [IATISchema].[xml:lang] NULL,
	[default-flow-type/@code] [int] NULL,
	[default-flow-type/@type] [IATISchema].[xsd:string] NULL,
	[default-flow-type/text()] [IATISchema].[xsd:string] NULL,
	[default-aid-type/@xml:lang] [IATISchema].[xml:lang] NULL,
	[default-aid-type/@code] [nchar](3) NULL,
	[default-aid-type/@type] [IATISchema].[xsd:string] NULL,
	[default-aid-type/text()] [IATISchema].[xsd:string] NULL,
	[default-finance-type/@xml:lang] [IATISchema].[xml:lang] NULL,
	[default-finance-type/@code] [int] NULL,
	[default-finance-type/@type] [IATISchema].[xsd:string] NULL,
	[default-finance-type/text()] [IATISchema].[xsd:string] NULL,
	[iati-identifier/text()] [nvarchar](255) NULL,
	[other-identifier/@owner-ref] [nvarchar](255) NULL,
	[other-identifier/@owner-name] [IATISchema].[xsd:string] NULL,
	[other-identifier/text()] [IATISchema].[xsd:string] NULL,
	[activity-status/@xml:lang] [IATISchema].[xml:lang] NULL,
	[activity-status/@code] [int] NULL,
	[activity-status/@type] [IATISchema].[xsd:string] NULL,
	[activity-status/text()] [IATISchema].[xsd:string] NULL,
	[default-tied-status/@xml:lang] [IATISchema].[xml:lang] NULL,
	[default-tied-status/@code] [int] NULL,
	[default-tied-status/@type] [IATISchema].[xsd:string] NULL,
	[default-tied-status/text()] [IATISchema].[xsd:string] NULL,
	[BumId] [varchar](25) NULL,
 CONSTRAINT [iati-activity$pk] PRIMARY KEY CLUSTERED 
(
	[iati-activityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[iati-activity/document-link]    Script Date: 20-02-2017 11:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[iati-activity/document-link](
	[iati-activity/document-linkID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[QuestID] [varchar](15) NULL,
	[@url] [IATISchema].[xsd:anyURI] NOT NULL,
	[@format] [nvarchar](255) NULL,
	[@language] [IATISchema].[xsd:language] NULL,
	[@LastUpdated-Month-Year] [varchar](25) NULL,
 CONSTRAINT [iati-activity/document-link$pk] PRIMARY KEY CLUSTERED 
(
	[iati-activity/document-linkID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[iati-activity/document-link/category]    Script Date: 20-02-2017 11:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[iati-activity/document-link/category](
	[iati-activity/document-link/categoryID] [int] IDENTITY(1,1) NOT NULL,
	[document-linkID] [int] NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@code] [nchar](3) NOT NULL,
	[@type] [IATISchema].[xsd:string] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [iati-activity/document-link/category$pk] PRIMARY KEY CLUSTERED 
(
	[iati-activity/document-link/categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[result/description]    Script Date: 20-02-2017 11:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[result/description](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[resultId] [int] NOT NULL,
	[@type] [int] NULL,
	[@xml:lang] [nchar](2) NULL,
	[text()] [nvarchar](max) NULL,
 CONSTRAINT [PK_result/description] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[iati-activity/document-link/language]    Script Date: 20-02-2017 11:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[iati-activity/document-link/language](
	[iati-activity/document-link/languageID] [int] IDENTITY(1,1) NOT NULL,
	[document-linkID] [int] NOT NULL,
	[@code] [nchar](2) NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [iati-activity/document-link/language$pk] PRIMARY KEY CLUSTERED 
(
	[iati-activity/document-link/languageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[CollaborationType]    Script Date: 20-02-2017 11:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[CollaborationType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [CollaborationType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [CollaborationType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[iati-activity/document-link/title]    Script Date: 20-02-2017 11:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[iati-activity/document-link/title](
	[iati-activity/document-link/titleID] [int] IDENTITY(1,1) NOT NULL,
	[document-linkID] [int] NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [iati-activity/document-link/title$pk] PRIMARY KEY CLUSTERED 
(
	[iati-activity/document-link/titleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[location]    Script Date: 20-02-2017 11:25:21 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[location](
	[locationID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@ref] [nvarchar](255) NULL,
	[location-id/@vocabulary] [IATISchema].[xsd:string] NULL,
	[location-id/@code] [IATISchema].[xsd:string] NULL,
	[name/narrative/@xml:lang] [IATISchema].[xml:lang] NULL,
	[name/narrative] [IATISchema].[xsd:string] NULL,
	[description/narrative/@xml:lang] [IATISchema].[xml:lang] NULL,
	[description/narrative] [IATISchema].[xsd:string] NULL,
	[activity-description/narrative/@xml:lang] [IATISchema].[xml:lang] NULL,
	[activity-description/narrative] [IATISchema].[xsd:string] NULL,
	[administrative/@level] [IATISchema].[xsd:string] NULL,
	[administrative/@code] [IATISchema].[xsd:string] NULL,
	[administrative/@vocabulary] [IATISchema].[xsd:string] NULL,
	[point/@srsName] [IATISchema].[xsd:string] NULL,
	[point/pos] [IATISchema].[xsd:string] NULL,
	[exactness/@code] [nvarchar](255) NULL,
	[location-reach/@code] [nvarchar](255) NULL,
	[location-class/@code] [nvarchar](255) NULL,
	[feature-designation/@code] [nvarchar](255) NULL,
 CONSTRAINT [location104$pk] PRIMARY KEY CLUSTERED 
(
	[locationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[result/indicator/target]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[result/indicator/target](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[result/indicatorId] [int] NOT NULL,
	[@year] [nvarchar](max) NULL,
	[@value] [nvarchar](max) NULL,
	[@xml:lang] [nchar](2) NULL,
	[text()] [nvarchar](max) NULL,
	[result/indicator/periodId] [int] NOT NULL,
 CONSTRAINT [PK_result/indicator/target] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[participating-org]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[participating-org](
	[participating-orgID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@ref] [nvarchar](255) NULL,
	[@type] [int] NULL,
	[@role] [nvarchar](255) NOT NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [participating-org$pk] PRIMARY KEY CLUSTERED 
(
	[participating-orgID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[result/indicator/actual]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[result/indicator/actual](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[result/indicatorId] [int] NOT NULL,
	[@year] [nvarchar](max) NULL,
	[@value] [nvarchar](max) NULL,
	[@xml:lang] [nchar](2) NULL,
	[text()] [nvarchar](max) NULL,
	[result/indicator/periodId] [int] NOT NULL,
 CONSTRAINT [PK_result/indicator/actual] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[Country]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[Country](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [Country$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Country$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[policy-marker]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[policy-marker](
	[policy-markerID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@code] [int] NOT NULL,
	[@type] [IATISchema].[xsd:string] NULL,
	[@vocabulary] [nvarchar](255) NULL,
	[@significance] [int] NOT NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [policy-marker$pk] PRIMARY KEY CLUSTERED 
(
	[policy-markerID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[recipient-country]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[recipient-country](
	[recipient-countryID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@code] [nchar](2) NOT NULL,
	[@type] [IATISchema].[xsd:string] NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@percentage] [IATISchema].[xsd:positiveInteger] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [recipient-country$pk] PRIMARY KEY CLUSTERED 
(
	[recipient-countryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[result/indicator/period]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[result/indicator/period](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[period-start/@iso-date] [IATISchema].[xsd:date] NOT NULL,
	[period-end/@iso-date] [IATISchema].[xsd:date] NOT NULL,
	[result/indicatorId] [int] NOT NULL,
 CONSTRAINT [PK_result/indicator/period] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[recipient-region]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[recipient-region](
	[recipient-regionID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@code] [int] NULL,
	[@type] [IATISchema].[xsd:string] NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@percentage] [IATISchema].[xsd:positiveInteger] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [recipient-region$pk] PRIMARY KEY CLUSTERED 
(
	[recipient-regionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[related-activity]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[related-activity](
	[related-activityID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@ref] [IATISchema].[xsd:string] NOT NULL,
	[@type] [int] NOT NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [related-activity$pk] PRIMARY KEY CLUSTERED 
(
	[related-activityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[DAC5DigitSector]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[DAC5DigitSector](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[CategoryCode] [int] NOT NULL,
 CONSTRAINT [Sector$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[sector]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[sector](
	[sectorID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@code] [int] NULL,
	[@type] [IATISchema].[xsd:string] NULL,
	[@other-code] [IATISchema].[xsd:string] NULL,
	[@vocabulary] [nvarchar](255) NULL,
	[@percentage] [IATISchema].[xsd:positiveInteger] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [sector$pk] PRIMARY KEY CLUSTERED 
(
	[sectorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[transaction]    Script Date: 20-02-2017 11:25:22 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[transaction](
	[transactionID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[IsExcluded] [bit] NOT NULL,
	[OriginalValue] [decimal](28, 3) NOT NULL,
	[@ref] [IATISchema].[xsd:string] NULL,
	[@type] [IATISchema].[xsd:string] NULL,
	[@flow] [IATISchema].[xsd:string] NULL,
	[value/@currency] [nchar](3) NULL,
	[value/@value-date] [IATISchema].[xsd:date] NULL,
	[value/@type] [IATISchema].[xsd:string] NULL,
	[value/text()] [decimal](18, 2) NULL,
	[transaction-type/@xml:lang] [IATISchema].[xml:lang] NULL,
	[transaction-type/@code] [nvarchar](255) NULL,
	[transaction-type/@type] [IATISchema].[xsd:string] NULL,
	[transaction-type/text()] [IATISchema].[xsd:string] NULL,
	[provider-org/@xml:lang] [IATISchema].[xml:lang] NULL,
	[provider-org/@ref] [nvarchar](255) NULL,
	[provider-org/@type] [IATISchema].[xsd:string] NULL,
	[provider-org/@provider-activity-id] [IATISchema].[xsd:string] NULL,
	[provider-org/text()] [IATISchema].[xsd:string] NULL,
	[receiver-org/@xml:lang] [IATISchema].[xml:lang] NULL,
	[receiver-org/@ref] [nvarchar](255) NULL,
	[receiver-org/@type] [IATISchema].[xsd:string] NULL,
	[receiver-org/@receiver-activity-id] [IATISchema].[xsd:string] NULL,
	[receiver-org/text()] [IATISchema].[xsd:string] NULL,
	[description/@xml:lang] [IATISchema].[xml:lang] NULL,
	[description/text()] [IATISchema].[xsd:string] NULL,
	[transaction-date/@iso-date] [IATISchema].[xsd:date] NULL,
	[transaction-date/text()] [IATISchema].[xsd:string] NULL,
	[flow-type/@xml:lang] [IATISchema].[xml:lang] NULL,
	[flow-type/@code] [int] NULL,
	[flow-type/@type] [IATISchema].[xsd:string] NULL,
	[flow-type/text()] [IATISchema].[xsd:string] NULL,
	[aid-type/@xml:lang] [IATISchema].[xml:lang] NULL,
	[aid-type/@code] [nchar](3) NULL,
	[aid-type/@type] [IATISchema].[xsd:string] NULL,
	[aid-type/text()] [IATISchema].[xsd:string] NULL,
	[finance-type/@xml:lang] [IATISchema].[xml:lang] NULL,
	[finance-type/@code] [int] NULL,
	[finance-type/@type] [IATISchema].[xsd:string] NULL,
	[finance-type/text()] [IATISchema].[xsd:string] NULL,
	[tied-status/@xml:lang] [IATISchema].[xml:lang] NULL,
	[tied-status/@code] [int] NULL,
	[tied-status/@type] [IATISchema].[xsd:string] NULL,
	[tied-status/text()] [IATISchema].[xsd:string] NULL,
	[disbursement-channel/@xml:lang] [IATISchema].[xml:lang] NULL,
	[disbursement-channel/@code] [nvarchar](255) NULL,
	[disbursement-channel/@type] [IATISchema].[xsd:string] NULL,
	[disbursement-channel/text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [transaction$pk] PRIMARY KEY CLUSTERED 
(
	[transactionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[DisbursementChannel]    Script Date: 20-02-2017 11:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[DisbursementChannel](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [DisbursementChannel$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DisbursementChannel$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[DocumentCategory]    Script Date: 20-02-2017 11:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[DocumentCategory](
	[Code] [nchar](3) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[CategoryCode] [nchar](1) NOT NULL,
 CONSTRAINT [DocumentContentType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DocumentContentType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[FinanceType]    Script Date: 20-02-2017 11:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[FinanceType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Category] [int] NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [FinanceType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [FinanceType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[FlowType]    Script Date: 20-02-2017 11:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[FlowType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [FlowType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [FlowType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[activity-humanitarian-scope]    Script Date: 20-02-2017 11:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[activity-humanitarian-scope](
	[activity-humanitarian-scope] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityId] [int] NOT NULL,
	[@type] [IATISchema].[xsd:string] NOT NULL,
	[@code] [IATISchema].[xsd:string] NOT NULL,
	[@vocabulary] [IATISchema].[xsd:string] NOT NULL,
	[@vocabulary-uri] [IATISchema].[xsd:anyURI] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[OrganisationIdentifier]    Script Date: 20-02-2017 11:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[OrganisationIdentifier](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [OrganisationIdentifier$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[PolicyMarker]    Script Date: 20-02-2017 11:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[PolicyMarker](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PolicyMarker$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [PolicyMarker$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[result]    Script Date: 20-02-2017 11:25:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[result](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[iati-activitiesId] [int] NOT NULL,
	[ActivityId] [varchar](25) NOT NULL,
	[@type] [int] NOT NULL,
	[title/@xml:lang] [nchar](2) NULL,
	[title/text()] [nvarchar](max) NULL,
	[description/@type] [int] NULL,
	[description/@xml:lang] [nchar](2) NULL,
	[description/text()] [nvarchar](max) NULL,
	[@aggregation-status] [bit] NULL,
 CONSTRAINT [PK_result] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [IATISchema].[v_Activity_201]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
























--DROP VIEW [IATISchema].[v_Activity_201]




CREATE VIEW [IATISchema].[v_Activity_201] AS
WITH
	Main AS
(
	SELECT
		 [iati-activityID]
		,[iati-activitiesID]
		,[ProjectId]
		,[ComponentId]
		,[BenefittingCountryCode]
		,[CountryCode]
		,[RegionCode]
		,(
			SELECT
 				 RTRIM([IATISchema].FormatXSDDateTime([iati-activity].[@last-updated-datetime])) AS [@last-updated-datetime]
				,[iati-activity].[@xml:lang]				
				,[iati-activity].[@default-currency]		
				,[iati-activity].[@hierarchy]			
				
				-- 1 iati-identifier
				,[iati-identifier/text()]
				
				-- 2 reporting-org
				,[iati-activity].[reporting-org/@xml:lang]
				,[iati-activity].[reporting-org/@ref]
				,[iati-activity].[reporting-org/@type]
				,ReportingOrganisation.Name AS [reporting-org/narrative]
				
				-- 3 title
				,(
					SELECT
						 [activity/title].[@xml:lang]
						,[activity/title].[text()] AS [narrative]		
					FROM
						 [IATISchema].[activity/title]
					WHERE
						 [activity/title].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('title'), TYPE
				)
				
				-- 4 description
				,(
					SELECT
						 [activity/description].[@xml:lang]
						,[activity/description].[@type]
						,[activity/description].[text()] AS [narrative]		
					FROM
						[IATISchema].[activity/description]
					WHERE
						[activity/description].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('description'), TYPE
				)
				
				-- 5 participating-org
				,(
					SELECT
					 	 [participating-org].[@xml:lang]	
						,[participating-org].[@ref]		
						,[participating-org].[@type]		
						,[participating-org].[@role]
						,COALESCE([participating-org].[text()], OrganisationIdentifier.Name, Country.Name) AS [narrative]		
					FROM
						[IATISchema].[participating-org]
					LEFT OUTER JOIN
						[Codelist].OrganisationIdentifier
					ON
						[participating-org].[@ref] = OrganisationIdentifier.Code
					LEFT OUTER JOIN
						[Codelist].Country
					ON
						[participating-org].[@ref] = Country.Code
					WHERE
						[participating-org].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('participating-org'), TYPE
				)
				
				-- 6 other-identifier
				,[other-identifier/text()] AS [other-identifier/@ref]
				,'A1' AS [other-identifier/@type]
				,[other-identifier/@owner-ref] AS [other-identifier/owner-org/@ref]
				,ISNULL([other-identifier/@owner-name], OtherIdentifierOwner.Name) AS [other-identifier/owner-org/narrative]
				
				,(
					SELECT
						 [@owner-ref]		AS [@ref]
						,[@type]			AS [@type]
						,[@owner-name]		AS [owner-org/@ref]
						,ISNULL([text()], 'N/A') AS [owner-org/narrative]
					FROM
						[IATISchema].[other-identifier]
					WHERE
						[ActivityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('other-identifier'), TYPE
				)

				-- 6 activity-status
				,[iati-activity].[activity-status/@xml:lang]	
				,[iati-activity].[activity-status/@code]		
				,[iati-activity].[activity-status/@type]						
				
				-- 7 activity-date
				,(
					SELECT [activity-date].[@type] AS [@type]
						   ,[IATISchema].FormatXSDDate([activity-date].[@iso-date]) AS [@iso-date]						
					FROM
						[IATISchema].[activity-date]
					WHERE
						[activity-date].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('activity-date'), TYPE
				)
				
				-- 8 contact-info
				,(
					SELECT
						'1' AS [@type]
						,[contact-info].[organisation/text()] AS [organisation/narrative]
						,[contact-info].[person-name/text()] AS [person-name/narrative]
						,(
							SELECT
								[contact-info/details].[telephone/text()] AS [telephone]		
								,[contact-info/details].[email/text()] AS [email]		
								--,[contact-info/details].[website/text()] AS [website] -- TODO	
								,[contact-info/details].[mailing-address/text()] AS [mailing-address/narrative]
							FROM
								[IATISchema].[contact-info/details]
							WHERE
								[contact-info/details].[contact-infoID] = [contact-info].[contact-infoID]
							FOR XML PATH (''), TYPE
						)
					FROM
						[IATISchema].[contact-info]
					WHERE
						[contact-info].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('contact-info'), TYPE
				)
				
				-- 10a activity-scope (TODO STILL TO BE ADDED TO THE SCHEMA???)

				-- 10b humanitarian-scope
				--,(
				--	SELECT
				--		 [activity-humanitarian-scope].[@type]
				--		,[activity-humanitarian-scope].[@code]
				--		,[activity-humanitarian-scope].[@vocabulary]
				--	FROM
				--		 [IATISchema].[activity-humanitarian-scope]
				--	WHERE
				--		 [activity-humanitarian-scope].[iati-activityId] = [iati-activity].[iati-activityId]
				--	FOR XML PATH ('humanitarian-scope'), TYPE
				--)
				
				
				-- 11 recipient-country
				,(
					SELECT
 						 [recipient-country].[@code]
						,[recipient-country].[@percentage]
					FROM
						[IATISchema].[recipient-country]
					LEFT OUTER JOIN
						[Codelist].Country
					ON
						[recipient-country].[@code] = Country.Code
					WHERE
						[recipient-country].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('recipient-country'), TYPE
				)
				
				-- 12 recipient-region
				,(
					SELECT
						 [recipient-region].[@code]
						,[recipient-region].[@percentage]
					FROM
						[IATISchema].[recipient-region]
					LEFT OUTER JOIN
						[Codelist].Region
					ON
						[recipient-region].[@code] = Region.Code
					WHERE
						[recipient-region].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('recipient-region'), TYPE
				)
				
				-- 13 location
				,(
					SELECT
						 [location].[@ref]					
						,[location].[location-reach/@code]
						,[location].[name/narrative]					
						,[location].[description/narrative]		
						,[location].[activity-description/narrative]			
						,[location].[administrative/@vocabulary]	
						,[location].[administrative/@level]		
						,[location].[administrative/@code]			
						,[location].[point/@srsName]
						,[location].[point/pos]		
						,[location].[exactness/@code]		
						,[location].[location-class/@code]		
						,[location].[feature-designation/@code]		
					FROM
						[IATISchema].[location]
					WHERE
						[location].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('location'), TYPE
				)				
				
				-- 14 sector
				,(
					SELECT
						 SchemaSector.[@xml:lang]
						,SchemaSector.[@vocabulary]
						,ISNULL(CONVERT(NVARCHAR(MAX), SchemaSector.[@code]), SchemaSector.[@other-code]) AS [@code]
						--,SchemaSector.[@type]
						,SchemaSector.[@percentage]
						,ISNULL(SchemaSector.[text()], CodeListSector.Name) AS [narrative]		
					FROM
						[IATISchema].[sector] SchemaSector
					LEFT OUTER JOIN
						[Codelist].DAC5DigitSector CodeListSector
					ON
						SchemaSector.[@code] = CodeListSector.Code
					WHERE
						SchemaSector.[iati-activityId] = [iati-activity].[iati-activityId]
					ORDER BY
						SchemaSector.[@vocabulary]
						,SchemaSector.[@percentage] DESC
						,ISNULL(CONVERT(NVARCHAR(MAX), SchemaSector.[@code]), SchemaSector.[@other-code])
					FOR XML PATH ('sector'), TYPE
				)
				
				-- 10b humanitarian-scope
				,(
					SELECT
						 [activity-humanitarian-scope].[@type]
						,[activity-humanitarian-scope].[@code]
						,[activity-humanitarian-scope].[@vocabulary]
					FROM
						 [IATISchema].[activity-humanitarian-scope]
					WHERE
						 [activity-humanitarian-scope].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('humanitarian-scope'), TYPE
				)

				-- 15 country-budget-items
				,(
					SELECT
						[country-budget-items].[@vocabulary]
						,(
							SELECT
								[@code]
								,[@percentage]
								,[text()] AS [description/narrative]
							FROM
								[IATISchema].[country-budget-items/budget-item]
							WHERE
								[country-budget-items/budget-item].[iati-activityID] = [iati-activity].[iati-activityID]
							FOR XML PATH ('budget-item'), TYPE
						)
					FROM
						[IATISchema].[country-budget-items]
					WHERE
						[country-budget-items].[iati-activityID] = [iati-activity].[iati-activityID]
					FOR XML PATH ('country-budget-items'), TYPE
				)				
				
				-- 16 policy-marker
				,(
					SELECT
						[policy-marker].[@xml:lang]		
						,[policy-marker].[@vocabulary]	
						,[policy-marker].[@code]			
						--,[policy-marker].[@type]			
						,[policy-marker].[@significance]	
						,ISNULL([policy-marker].[text()], PolicyMarker.Name) AS [narrative]
					FROM
						[IATISchema].[policy-marker]
					LEFT OUTER JOIN
						[Codelist].PolicyMarker
					ON
						[policy-marker].[@code] = PolicyMarker.Code
					WHERE
						[policy-marker].[iati-activityId] = [iati-activity].[iati-activityId]
					ORDER BY
						[policy-marker].[@code]
					FOR XML PATH ('policy-marker'), TYPE
				)
				
				-- 17 collaboration-type
				--,[iati-activity].[collaboration-type/@xml:lang]
				,[iati-activity].[collaboration-type/@code]
				--,[iati-activity].[collaboration-type/@type]
				--,ISNULL([iati-activity].[collaboration-type/text()], CollaborationType.Name) AS [collaboration-type/text()]
--				,(
--					SELECT
--						[collaboration-type].[@xml:lang]
--						,[collaboration-type].[@code]
--						,[collaboration-type].[@type]
--						,CollaborationType.Name AS [text()]		
--					FROM
--						$(ActivitiesSchema).[collaboration-type]
--					LEFT OUTER JOIN
--						$(CodeListSchema).CollaborationType
--					ON
--						[collaboration-type].[@code] = CollaborationType.Code
--					WHERE
--						[collaboration-type].[iati-activityId] = [iati-activity].[iati-activityId]
--					FOR XML PATH ('collaboration-type'), TYPE
--				)
				
				-- 18 default-flow-type
				,[default-flow-type/@code]		
				
				-- 19 default-finance-type
				,[default-finance-type/@code]	
				
				-- 20 default-aid-type
				,[default-aid-type/@code]		
				
				-- 21 default-tied-status
				,[default-tied-status/@code]		
				
				-- 22 budget
				,(
					SELECT
						[budget].[@type]
						,[IATISchema].[FormatXSDDate]([budget].[period-start/@iso-date]) AS [period-start/@iso-date]
						,[IATISchema].[FormatXSDDate]([budget].[period-end/@iso-date]) AS [period-end/@iso-date] 
						,[IATISchema].[FormatXSDDate]([budget].[value/@value-date]) AS [value/@value-date]
						,[budget].[value/@currency]
						,[budget].[value/text()]						
					FROM
						[IATISchema].[budget]
					WHERE
						[budget].[iati-activityID] = [iati-activity].[iati-activityId]
					ORDER BY
						[budget].[period-start/@iso-date]
					FOR XML PATH ('budget'),TYPE
				)
				
				-- 23 planned-disbursement
				
				-- 24 capital-spend
		 	    ,(
					SELECT
						[capital-spend].[@percentage]
					FROM
						[IATISchema].[capital-spend]
					WHERE
						[capital-spend].[iati-activityId] = [iati-activity].[iati-activityId]
					FOR XML PATH ('capital-spend'), TYPE
				)				
				
				-- 25 transaction
				,(
					SELECT
						 [transaction].[@ref]								
						,[transaction].[transaction-type/@code]				
						,[IATISchema].FormatXSDDate([transaction].[transaction-date/@iso-date]) AS [transaction-date/@iso-date]
						,[transaction].[value/@currency]					
						,[IATISchema].FormatXSDDate([transaction].[value/@value-date]) AS [value/@value-date]
						,[transaction].[value/text()]						
						,[transaction].[description/@xml:lang]				
						,[transaction].[description/text()]	AS [description/narrative]
						,[transaction].[provider-org/@provider-activity-id]	
						,[transaction].[provider-org/@ref]					
						--,[transaction].[provider-org/@type]					
						,ISNULL([transaction].[provider-org/text()], provider.Name) AS [provider-org/narrative]
						,[transaction].[receiver-org/@receiver-activity-id]	
						,[transaction].[receiver-org/@ref]					
						--,[transaction].[receiver-org/@type]					
						,ISNULL([transaction].[receiver-org/text()], receiver.Name) AS [receiver-org/narrative]
						--,[transaction].[disbursement-channel/@xml:lang]		
						,[transaction].[disbursement-channel/@code]			
						--,[transaction].[disbursement-channel/@type]			
						--,ISNULL([transaction].[disbursement-channel/text()], DisbursementChannel.Name) AS [disbursement-channel/text()]
						-- TODO: Sector
						-- TODO: Recipient Country
						-- TODO: Recipient Region
						--,[transaction].[@flow]								
						--,[transaction].[flow-type/@xml:lang]				
						,[transaction].[flow-type/@code]					
						--,[transaction].[flow-type/@type]					
						--,ISNULL([transaction].[flow-type/text()], FlowType.Name) AS [flow-type/text()]
						--,[transaction].[finance-type/@xml:lang]				
						,[transaction].[finance-type/@code]					
						--,[transaction].[finance-type/@type]					
						--,ISNULL([transaction].[finance-type/text()], FinanceType.Name) AS [finance-type/text()]
						--,[transaction].[aid-type/@xml:lang]					
						,[transaction].[aid-type/@code]						
						--,[transaction].[aid-type/@type]						
						--,ISNULL([transaction].[aid-type/text()], AidType.Name) AS [aid-type/text()]
						--,[transaction].[tied-status/@xml:lang]				
						,[transaction].[tied-status/@code]					
						--,[transaction].[tied-status/@type]					
						--,ISNULL([transaction].[tied-status/text()], TiedStatus.Name) AS [tied-status/text()]
					FROM
						[IATISchema].[transaction]
					LEFT OUTER JOIN
						[Codelist].TransactionType
					ON
						[transaction].[transaction-type/@code] = TransactionType.Code
					LEFT OUTER JOIN
						[Codelist].OrganisationIdentifier provider
					ON
						[transaction].[provider-org/@ref] = provider.Code
					LEFT OUTER JOIN
						[Codelist].OrganisationIdentifier receiver
					ON
						[transaction].[receiver-org/@ref] = receiver.Code
					LEFT OUTER JOIN
						[Codelist].FlowType
					ON
						[transaction].[flow-type/@code] = FlowType.Code
					LEFT OUTER JOIN
						[Codelist].AidType
					ON
						[transaction].[aid-type/@code] = AidType.Code
					LEFT OUTER JOIN
						[Codelist].FinanceType
					ON
						[transaction].[finance-type/@code] = FinanceType.Code
					LEFT OUTER JOIN
						[Codelist].TiedStatus
					ON
						[transaction].[tied-status/@code] = TiedStatus.Code
					LEFT OUTER JOIN
						[Codelist].DisbursementChannel
					ON
						[transaction].[disbursement-channel/@code] = DisbursementChannel.Code
					WHERE
						[transaction].[iati-activityId] = [iati-activity].[iati-activityId]
					ORDER BY
						[transaction].[transaction-type/@code]
						,[transaction].[transaction-date/@iso-date]
					FOR XML PATH ('transaction'), TYPE
				)
				
				-- 26 document-link
				,(
					SELECT
					 	 [iati-activity/document-link].[@format]
						,[iati-activity/document-link].[@url]
						--,[iati-activity/document-link].[@language]
						,(
							SELECT
								[@xml:lang]
								,[text()] AS [narrative]
							FROM
								[IATISchema].[iati-activity/document-link/title]
							WHERE
								[document-linkID] = [iati-activity/document-link].[iati-activity/document-linkID]
							ORDER BY
								CASE WHEN [@xml:lang] = 'en' THEN 1 ELSE 2 END
								,[@xml:lang]
								,[text()]
							FOR XML PATH ('title'), TYPE
						)
						,( -- category
							SELECT
								--[iati-activity/document-link/category].[@xml:lang]
								[iati-activity/document-link/category].[@code]
								--,[iati-activity/document-link/category].[@type]
								--,DocumentContentType.Name AS [text()]
							FROM
								[IATISchema].[iati-activity/document-link/category]
							LEFT OUTER JOIN
								[Codelist].[DocumentCategory] 
							ON
								[iati-activity/document-link/category].[@code] = [DocumentCategory].Code
							WHERE
								[iati-activity/document-link/category].[document-linkID] = [iati-activity/document-link].[iati-activity/document-linkID]
							ORDER BY
								CASE WHEN [iati-activity/document-link/category].[@xml:lang] = 'en' THEN 1 ELSE 2 END
								,[iati-activity/document-link/category].[@xml:lang]
								,[DocumentCategory].Name
							FOR XML PATH ('category'), TYPE
						)
						,( -- language
							SELECT
								[@code]
								--,[@xml:lang]
								--,[text()]
							FROM
								[IATISchema].[iati-activity/document-link/language]
							WHERE
								[document-linkID] = [iati-activity/document-link].[iati-activity/document-linkID]
							ORDER BY
								CASE WHEN [@xml:lang] = 'en' THEN 1 ELSE 2 END
								,[@xml:lang]
								,[text()]
							FOR XML PATH ('language'), TYPE
						)
					FROM
						[IATISchema].[iati-activity/document-link]
					WHERE
						[iati-activity/document-link].[iati-activityID] = [iati-activity].[iati-activityID]
					ORDER BY
						[iati-activity/document-link].QuestID
					FOR XML PATH ('document-link'), TYPE
				)
				
				-- 27 activity-website
				
				-- 28 related-activity
				,(
					SELECT
						 [related-activity].[@ref]				
						,[related-activity].[@type]
					FROM
						[IATISchema].[related-activity]
--					LEFT OUTER JOIN
--						$(CodeListSchema).RelatedActivityType
--					ON
--						[related-activity].[@type] = RelatedActivityType.Code
					WHERE
						[related-activity].[iati-activityId] = [iati-activity].[iati-activityId]
					-- order by type (parent, child, sibling), reference (Component ID)
					ORDER BY
						[related-activity].[@type]	-- parent, child then sibling
						,[related-activity].[@ref]
					FOR XML PATH ('related-activity'), TYPE
				)

				-- 31 legacy-data
				-- TODO we do not handle legacy data correctly
				-- removed for now
		 	--    ,(
				--	SELECT
				--		[legacy-data].[@name]
				--		,[legacy-data].[text()] as [@value]
				--		,[legacy-data].[@iati-equivalent]
				--		--,[legacy-data].[text()]
				--	FROM
				--		[IATISchema].[legacy-data]
				--	WHERE
				--		[legacy-data].[iati-activityId] = [iati-activity].[iati-activityId]
				--	FOR XML PATH ('legacy-data'), TYPE
				--)				
				-- 29 conditions
				,(
					SELECT
						[conditions].[@attached]
						,(
							SELECT
								[@type]
								,[text()] AS [narrative]
							FROM
								[IATISchema].[conditions/condition]
							WHERE
								[conditionsID] = [conditions].[conditionsID]
							FOR XML PATH ('condition'), TYPE
						)
					FROM
						[IATISchema].[conditions]
					WHERE
						[conditions].[iati-activityID] = [iati-activity].[iati-activityID]
					FOR XML PATH ('conditions'), TYPE
				)
				
				-- 30 result
				,
				(
					SELECT        -- FROM [IATISchema].[result]
						-- result
						 [result].[@type]
						,[result].[@aggregation-status]
						-- result/title
						,[result].[title/text()] AS [title/narrative]
						,
						(
							-- not used:
							SELECT
								 [result/title].[@xml:lang]
								,[result/title].[text()]
							FROM
								[IATISchema].[result/title]
							WHERE
								[result].[Id] = [result/title].[resultId]
							ORDER BY
								[result/title].[Id]
							FOR XML PATH ('title'), TYPE
						)
						, 
						-- result/decription
						 [result].[description/text()] AS [description/narrative]
						,
						(
							-- not used:
							SELECT
								 [result/description].[@xml:lang]
								,[result/description].[@type]
								,[result/description].[text()] 
							FROM
								[IATISchema].[result/description]
							WHERE
								[result].[Id] = [result/description].[resultId]
							ORDER BY
								[result/description].[Id]
							FOR XML PATH ('description'), TYPE
						)
						,
						(
							SELECT			-- FROM [IATISchema].[result/indicator]
								-- result/indicator
							 	 [result/indicator].[@measure]		
								,[result/indicator].[@ascending]		
								,[result/indicator].[title/text()] AS [title/narrative]
								,
								(
									-- not used:
									SELECT
										 [result/indicator/title].[@xml:lang]
										,[result/indicator/title].[text()]
									FROM
										[IATISchema].[result/indicator/title]
									WHERE
										[result/indicator].[Id] = [result/indicator/title].[result/indicatorId]
									ORDER BY
										[result/indicator/title].[Id]
									FOR XML PATH ('title'), TYPE
								)
								,[result/indicator].[description/text()] AS [description/narrative]
								,
								(
									-- not used:
									SELECT
										 [result/indicator/description].[@xml:lang]
										,[result/indicator/description].[@type]
										,[result/indicator/description].[text()]
									FROM
										[IATISchema].[result/indicator/description]
									WHERE
										[result/indicator].[Id] = [result/indicator/description].[result/indicatorId]
									ORDER BY
										[result/indicator/description].[Id]
									FOR XML PATH ('description'), TYPE
								)
								-- result/indicator/baseline
								,[result/indicator].[baseline/@year]
								,[result/indicator].[baseline/@value]
								,[result/indicator].[baseline/text()]
								,

								--***********************************
								(
									SELECT  	-- [IATISchema].[result/indicator/period] WHERE [result].Id = [resultId]
									 [IATISchema].[FormatXSDDate]([result/indicator/period].[period-start/@iso-date]) AS [period-start/@iso-date]
									,[IATISchema].[FormatXSDDate]([result/indicator/period].[period-end/@iso-date]) AS [period-end/@iso-date] 
																		
								--	(
										-- result/indicator/period-start
									--	SELECT
									--		 [result/indicator/target].[@year] AS [@iso-date]		
									--	FROM
									--		[IATISchema].[result/indicator/target]
									--	WHERE
									--		[result/indicator].[Id] = [result/indicator/target].[result/indicatorId]
									--	ORDER BY
									--		[result/indicator/target].[Id]
									--	FOR XML PATH ('period-start'), TYPE
									--)
									--,
									--(
									--	-- result/indicator/period-end
									--	SELECT
									--		 [result/indicator/target].[@year] AS [@iso-date]		
									--	FROM
									--		[IATISchema].[result/indicator/target]
									--	WHERE
									--		[result/indicator].[Id] = [result/indicator/target].[result/indicatorId]
									--	ORDER BY
									--		[result/indicator/target].[Id]
									--	FOR XML PATH ('period-end'), TYPE
									--)
									--,

									,
									(
										-- result/indicator/target
										SELECT
											[result/indicator/target].[@value]
										FROM
											[IATISchema].[result/indicator/target]
										WHERE
											[result/indicator/period].[Id] = [result/indicator/periodId]
										ORDER BY
											[result/indicator/target].[Id]
										FOR XML PATH ('target'), TYPE
									)
									,
									(
										-- result/indicator/actual
										SELECT
											[result/indicator/actual].[@value]	
										FROM
											[IATISchema].[result/indicator/actual]
										WHERE
											[result/indicator/period].[Id] = [result/indicator/periodId]
										ORDER BY
											[result/indicator/actual].[Id]
										FOR XML PATH ('actual'), TYPE
									)
								FROM 
									[IATISchema].[result/indicator/period]
								WHERE 
									[result].Id = [resultId]
								AND
									[result/indicator/period].[result/indicatorId] = [result/indicator].[Id]
								FOR XML PATH ('period'), TYPE)		
														
							
							FROM
								[IATISchema].[result/indicator] 
							WHERE
								[result/indicator].[resultId] = [result].[Id]
							ORDER BY
								[result/indicator].[Id]
							FOR XML PATH ('indicator'), TYPE
						)
					FROM
						[IATISchema].[result]
					WHERE
						[iati-activitiesId] = [result].[iati-activitiesId]
						AND [result].[ActivityId] = [iati-activity].[ProjectId]
					ORDER BY
						[result].[Id]
					FOR XML PATH ('result'), TYPE
				)				
--- *** Result end ****************************************************************
				

			FROM
				[IATISchema].[iati-activity]
			LEFT OUTER JOIN
				[Codelist].OrganisationIdentifier ReportingOrganisation
			ON
				[iati-activity].[reporting-org/@ref] = ReportingOrganisation.Code
			LEFT OUTER JOIN
				[Codelist].CollaborationType
			ON
				[iati-activity].[collaboration-type/@code] = CollaborationType.Code
			LEFT OUTER JOIN
				[Codelist].FlowType
			ON
				[iati-activity].[default-flow-type/@code] = FlowType.Code
			LEFT OUTER JOIN
				[Codelist].AidType
			ON
				[iati-activity].[default-aid-type/@code] = AidType.Code
			LEFT OUTER JOIN
				[Codelist].FinanceType
			ON
				[iati-activity].[default-finance-type/@code] = FinanceType.Code
			LEFT OUTER JOIN
				[Codelist].OrganisationIdentifier OtherIdentifierOwner
			ON
				[iati-activity].[other-identifier/@owner-ref] = OtherIdentifierOwner.Code
			LEFT OUTER JOIN
				[Codelist].ActivityStatus
			ON
				[iati-activity].[activity-status/@code] = ActivityStatus.Code
			LEFT OUTER JOIN
				[Codelist].TiedStatus
			ON
				[iati-activity].[default-tied-status/@code] = TiedStatus.Code
			WHERE
				[iati-activity].[iati-activityId] = o.[iati-activityId]
			ORDER BY
				[iati-activity].[iati-identifier/text()]
			FOR XML PATH ('iati-activity'), TYPE
		) XML
	FROM
		[IATISchema].[iati-activity] o
)
SELECT
	[iati-activityID]
	,[iati-activitiesID]
	,[ProjectId]
	,[ComponentId]
	,[BenefittingCountryCode]
	,[CountryCode]
	,[RegionCode]
	,XML AS UntypedXML
	--,CONVERT(XML ($(ActivitiesSchema).SchemaCollection), XML) AS TypedXML
FROM
	Main































GO
/****** Object:  UserDefinedFunction [IATISchema].[f_ActivitiesXMLFile_201]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO






--DROP FUNCTION [IATISchema].[f_ActivitiesXMLFile_201]

/* Using this function to return IATI XML data from the database

-- Return IATI XML data for the Dfid project GB-1-204024
Select TypedXML 
From IATISchema.f_activitiesXMLFile_201(101,'204024',null,null,null,null,null,'Dfid-Project-204024')

-- Return IATI XML data for the Dfid level 2 project GB-1-204024-101
Select TypedXML 
From IATISchema.f_activitiesXMLFile_201(101,null,'204024-101',null,null,null,null,'Dfid-L2Project-204024-101')

-- Return NonIatiRegion IATI XML data for the Dfid defined "Sahel" area
Select TypedXML 
From IATISchema.f_activitiesXMLFile_201(101,null,null,'SF',null,null,null,'Dfid-Sahel-SF')

-- Return country IATI XML data for Afghanistan
Select UnTypedXML 
From IATISchema.f_activitiesXMLFile_201(1,null,null,null,null,'AZ',null,null)

-- Return IATI XML data for Activity 101101
Select UnTypedXML 
From IATISchema.f_activitiesXMLFile_201(1,'101101',null,null,null,null,null,null)

-- Return region IATI XML data for the OECD defined "Middle East Regional" area
Select TypedXML 
From IATISchema.f_activitiesXMLFile_201(101,null,null,null,null,null,'589','Dfid-MiddleEastRegional-589')

-- Return all projects and related level two projects (i.e. everything) in IATI XML format 
Select TypedXML 
From IATISchema.f_activitiesXMLFile_201 (101, '0', NULL, NULL, NULL, NULL, NULL,'Dfid-All-Projects')

-- Return all level two projects and related level one projects , i.e. everything
Select TypedXML 
From IATISchema.f_activitiesXMLFile_201(101, NULL, '0', NULL, NULL, NULL, NULL, 'Dfid-All-Level-Two-Projects')

-- Return all activities associated with IATI/ISO countries
Select TypedXML 
From IATISchema.f_activitiesXMLFile_201(101, NULL, NULL, NULL, NULL, '0', NULL,'Dfid-ISO-Country-Projects')

-- Return all activities associated with IATI/DAC regions
Select TypedXML 
From IATISchema.f_activitiesXMLFile_201(101, NULL, NULL, NULL, NULL, NULL, 0,'Dfid-OECD-Region-Projects')

-- Return all projects that are not associated with either an IATI country or region
Select TypedXML 
From IATISchema.f_activitiesXMLFile_201(101, NULL, NULL, '0', 1, NULL, NULL,'Dfid-Non-Iati-Region-Projects')


*/


CREATE FUNCTION [IATISchema].[f_ActivitiesXMLFile_201]
(
	@ActivitiesId					INT
	,@ProjectId						VARCHAR(25)
	,@ComponentId					VARCHAR(25)
	,@BenefittingCountryCode		VARCHAR(25)
	,@BenefittingCountryNonIATIOnly	BIT
	,@CountryCode					NCHAR(2)
	,@RegionCode					INT
	,@URI							[IATISchema].[xsd:anyURI]
)
RETURNS
	TABLE
AS
RETURN
(
	WITH
		--XMLNAMESPACES ('http://iatiregistry.org/ns/record#' AS ir),
		SelectedComponents AS
	(
		SELECT
			*
		FROM
			[IATISchema].v_Activity_201
		WHERE
			ComponentId IS NOT NULL
			AND (@ProjectId IS NULL OR (@ProjectId = '0' AND @ProjectId IS NOT NULL) OR ProjectId = @ProjectId)
			AND (@ComponentId IS NULL OR (@ComponentId = '0' AND @ComponentId IS NOT NULL) OR ComponentId = @ComponentId)
			AND
			(
				(@BenefittingCountryCode IS NULL AND @BenefittingCountryNonIATIOnly IS NULL) -- if no parameters passed then allow everything
				OR (@BenefittingCountryCode IS NULL AND @BenefittingCountryNonIATIOnly IS NOT NULL AND BenefittingCountryCode IS NULL) -- allows us to individually select the records with no benefitting country
				OR
				(
					(@BenefittingCountryNonIATIOnly = 0 OR (CountryCode IS NULL AND RegionCode IS NULL)) -- the @BenefittingCountryNonIATIOnly flag controls whether it is possible to search for a benefitting country that has been mapped to an IATI country or region
					AND
					(
						(
							@BenefittingCountryCode = '0'
							--AND BenefittingCountryCode IS NOT NULL
						)
						OR BenefittingCountryCode = @BenefittingCountryCode
					)
				)
			)
			AND (@CountryCode IS NULL OR (@CountryCode = N'0' AND CountryCode IS NOT NULL) OR CountryCode = @CountryCode)
			AND (@RegionCode IS NULL OR (@RegionCode = 0 AND RegionCode IS NOT NULL) OR RegionCode = @RegionCode)
	)
		,RelatedProjects AS
	(
		SELECT * FROM [IATISchema].v_Activity_201 WHERE ComponentId IS NULL AND ((@ComponentId IS NULL AND ProjectId = @ProjectId) OR ProjectId IN (SELECT ProjectId FROM SelectedComponents) AND ComponentId IS NULL)
	)
		,Main AS
	(
		SELECT
			[iati-activitiesID]
			,[Name]
			,[Notes]
			,(
				SELECT
					'2.02' as [@version]
					,[IATISchema].FormatXSDDateTime([@generated-datetime]) AS [@generated-datetime]
					,(
						SELECT
							UntypedXML AS [*]
						FROM
						(
							SELECT
								ProjectId, ComponentId, UntypedXML
							FROM
								SelectedComponents
							UNION ALL
							SELECT
								ProjectId, ComponentId, UntypedXML
							FROM
								RelatedProjects
						) q
						ORDER BY
							ProjectId, ComponentId
						FOR XML PATH (''), TYPE
					)
				FROM
					[IATISchema].[iati-activities]
				WHERE
					[iati-activities].[iati-activitiesID] = o.[iati-activitiesID]
				FOR XML PATH ('iati-activities'), TYPE
			) XML
		FROM
			[IATISchema].[iati-activities] o
		WHERE
			[iati-activitiesID] = @ActivitiesId
	)
	SELECT
		[iati-activitiesID]
		,[Name]
		,[Notes]
		,XML AS UntypedXML
		,CONVERT(XML,CONVERT(XML ([IATISchema].[SchemaCollection_2.02]), XML)) AS TypedXML
	FROM
		Main
)







GO
/****** Object:  Table [Codelist].[BudgetIdentifier]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[BudgetIdentifier](
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[Category] [nvarchar](255) NOT NULL,
 CONSTRAINT [BudgetIdentifier$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [BudgetIdentifier$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[BudgetIdentifierSector]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[BudgetIdentifierSector](
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[Category] [nvarchar](255) NOT NULL,
 CONSTRAINT [BudgetIdentifierSector$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [BudgetIdentifierSector$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[BudgetIdentifierSectorCategory]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[BudgetIdentifierSectorCategory](
	[Code] [nvarchar](10) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [BudgetIdentifierSectorCategory$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [BudgetIdentifierSectorCategory$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  View [Codelist].[v_RecipientCountryBudgetIdentifier]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE VIEW [Codelist].[v_RecipientCountryBudgetIdentifier] AS SELECT A.Code,A.Name AS [Function],C.Name Category,B.Name BudgetSector FROM Codelist.BudgetIdentifier A INNER JOIN 
Codelist.BudgetIdentifierSector B ON (A.Category=B.Code)
INNER JOIN Codelist.BudgetIdentifierSectorCategory C ON (B.Category=C.Code)

GO
/****** Object:  Table [UM].[Country]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UM].[Country](
	[country_code] [nvarchar](5) NULL,
	[name_uk] [nvarchar](60) NULL,
	[name_dk] [nvarchar](60) NULL,
	[parent_code] [nvarchar](5) NULL,
	[ID] [int] NOT NULL,
	[country_code_iati] [nvarchar](5) NULL,
	[Code] [int] NULL,
	[CountryType] [varchar](40) NULL,
	[partner_country_yn] [varchar](3) NULL
) ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[ActivityDateType]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[ActivityDateType](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [ActivityDateType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ActivityDateType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[ActivityScope]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[ActivityScope](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [ActivityScope$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ActivityScope$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[AidTypeCategory]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[AidTypeCategory](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
	[StandardDescription]  AS ((([Code]+' - ')+[Name])+case when [Description] IS NULL then '' else ' - '+[Description] end),
 CONSTRAINT [AidTypeCategory$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [AidTypeCategory$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[BudgetIdentifierVocabulary]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[BudgetIdentifierVocabulary](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [BudgetIdentifierVocabulary$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [BudgetIdentifierVocabulary$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[BudgetType]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[BudgetType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [BudgetType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [BudgetType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[ConditionsAttached_ToBeRemoved]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[ConditionsAttached_ToBeRemoved](
	[Code] [int] NOT NULL,
	[Text] [nvarchar](255) NOT NULL,
 CONSTRAINT [ConditionsAttached$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ConditionsAttached$uq$Text] UNIQUE NONCLUSTERED 
(
	[Text] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[ConditionType]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[ConditionType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [ConditionType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ConditionType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[ContractType]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[ContractType](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [ContractType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ContractType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[CRSAdditionalOtherFlags]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[CRSAdditionalOtherFlags](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [CRSAdditionaOtherFlags$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [CRSAdditionaOtherFlags$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[Currency]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[Currency](
	[Code] [nchar](3) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [Currency$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Currency$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[DAC3DigitSector]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[DAC3DigitSector](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [DAC3DigitSector$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DAC3DigitSector$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[DescriptionType]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[DescriptionType](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [DescriptionType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DescriptionType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[DocumentCategoryCategory]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[DocumentCategoryCategory](
	[Code] [nchar](1) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [DocumentContentTypeCategory$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [DocumentContentTypeCategory$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[FileFormat]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[FileFormat](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NULL,
	[Description] [nvarchar](255) NULL,
	[Category] [nvarchar](70) NOT NULL,
 CONSTRAINT [FileFormat$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[FinanceTypeCategory]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[FinanceTypeCategory](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NULL,
 CONSTRAINT [FinanceTypeCategory$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [FinanceTypeCategory$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[GazetteerAgency]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[GazetteerAgency](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [GazetteerAgency$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [GazetteerAgency$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[GeographicalPrecision]    Script Date: 20-02-2017 11:25:24 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[GeographicalPrecision](
	[Code] [int] NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [GeographicalPrecision$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[GeographicExactness]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[GeographicExactness](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [GeographicExactness$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [GeographicExactness$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[GeographicLocationClass]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[GeographicLocationClass](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [LocationClass$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [LocationClass$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[GeographicLocationReach]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[GeographicLocationReach](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [LocationReach$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [LocationReach$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[GeographicVocabulary]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[GeographicVocabulary](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[URL] [varchar](255) NULL,
 CONSTRAINT [GeographicVocabulary$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [GeographicVocabulary$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[IATIOrganisationIdentifier]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[IATIOrganisationIdentifier](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[URL] [varchar](255) NULL,
 CONSTRAINT [IATIOrganisationIdentifier$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IATIOrganisationIdentifier$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[IndicatorMeasure]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[IndicatorMeasure](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [IndicatorMeasure$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [IndicatorMeasure$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[Language]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[Language](
	[Code] [nchar](2) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [Language$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [Language$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[LoanRepaymentPeriod]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[LoanRepaymentPeriod](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [LoanRepaymentPeriod$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [LoanRepaymentPeriod$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[LoanRepaymentType]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[LoanRepaymentType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [LoanRepaymentType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [LoanRepaymentType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[LocationType]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[LocationType](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[Category] [nvarchar](2) NOT NULL,
 CONSTRAINT [LocationType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [LocationType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[LocationTypeCategory]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[LocationTypeCategory](
	[Code] [nvarchar](2) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [LocationTypeCategory$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [LocationTypeCategory$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[OrganisationRegistrationAgency]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[OrganisationRegistrationAgency](
	[Code] [nvarchar](30) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[Category] [nchar](2) NOT NULL,
	[URL] [varchar](max) NULL,
	[PublicDatabase] [varchar](5) NULL,
 CONSTRAINT [OrganisationRegistrationAgency$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [OrganisationRegistrationAgency$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[OrganisationRole]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[OrganisationRole](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [OrganisationRole$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [OrganisationRole$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[OrganisationType]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[OrganisationType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [OrganisationType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [OrganisationType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[OtherIdentifierType]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[OtherIdentifierType](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [OtherIdentifierType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [OtherIdentifierType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[PolicyMarkerVocabulary]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[PolicyMarkerVocabulary](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PolicyMarkerVocabulary$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [PolicyMarkerVocabulary$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[PolicySignificance]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[PolicySignificance](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PolicySignificance$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [PolicySignificance$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[PublisherType]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[PublisherType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [PublisherType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [PublisherType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[RegionVocabulary]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[RegionVocabulary](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [RegionVocabulary$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RegionVocabulary$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[RelatedActivityType]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[RelatedActivityType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [RelatedActivityType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [RelatedActivityType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[ResultType]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[ResultType](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [ResultType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [ResultType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[SectorCategory]    Script Date: 20-02-2017 11:25:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[SectorCategory](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[ParentCode] [int] NULL,
 CONSTRAINT [SectorCategory$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[SectorVocabulary]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[SectorVocabulary](
	[Code] [nvarchar](255) NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
	[URL] [nvarchar](255) NULL,
 CONSTRAINT [SectorVocabulary$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [SectorVocabulary$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[VerificationStatus]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[VerificationStatus](
	[Code] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
	[Description] [varchar](max) NULL,
 CONSTRAINT [VerificationStatus$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [VerificationStatus$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Codelist].[Version]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Codelist].[Version](
	[Code] [nvarchar](5) NOT NULL,
	[URL] [varchar](max) NOT NULL,
 CONSTRAINT [Version$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [Configuration].[Error]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuration].[Error](
	[ErrorId] [int] IDENTITY(1,1) NOT NULL,
	[Number] [int] NULL,
	[Message] [nvarchar](4000) NULL,
	[Severity] [int] NULL,
	[State] [int] NULL,
	[Procedure] [nvarchar](126) NULL,
	[Line] [int] NULL,
	[Date] [datetime] NULL,
	[Login] [sysname] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ErrorId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [Configuration].[FiscalPeriod]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Configuration].[FiscalPeriod](
	[FiscalYear] [int] NOT NULL,
	[FiscalQuarter] [int] NULL,
	[FiscalPeriod] [int] NOT NULL,
	[FiscalPeriodZeroPadded] [varchar](2) NULL,
	[FiscalYearNameAndPeriodZeroPadded] [varchar](12) NULL,
	[FiscalYearShortNameAndPeriodZeroPadded] [varchar](8) NULL,
	[FiscalYearAndPeriodARIESStyle] [int] NULL,
	[FiscalPeriodFirstDay] [datetime] NULL,
	[FiscalPeriodLastDay] [datetime] NULL,
	[CalendarYear] [int] NULL,
	[CalendarMonth] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[activity-scope]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[activity-scope](
	[activity-scopeId] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityId] [int] NOT NULL,
	[@code] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_IATISchema]].[activity-scope] PRIMARY KEY CLUSTERED 
(
	[activity-scopeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[collaboration-type]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[collaboration-type](
	[collaboration-typeID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@xml:lang] [IATISchema].[xml:lang] NULL,
	[@code] [int] NOT NULL,
	[@type] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [collaboration-type$pk] PRIMARY KEY CLUSTERED 
(
	[collaboration-typeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [IATISchema].[legacy-data]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [IATISchema].[legacy-data](
	[legacy-dataID] [int] IDENTITY(1,1) NOT NULL,
	[iati-activityID] [int] NOT NULL,
	[@name] [IATISchema].[xsd:string] NOT NULL,
	[@value] [IATISchema].[xsd:string] NOT NULL,
	[@iati-equivalent] [IATISchema].[xsd:NMTOKEN] NULL,
	[text()] [IATISchema].[xsd:string] NULL,
 CONSTRAINT [legacy-data$pk] PRIMARY KEY CLUSTERED 
(
	[legacy-dataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ComponentsOnStaging]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ComponentsOnStaging](
	[ProjectCode] [nvarchar](12) NOT NULL,
	[ComponentCode] [nvarchar](15) NOT NULL,
	[DateFirstReleased] [datetime] NULL,
	[Status] [nvarchar](25) NOT NULL,
	[StatusFinData] [nvarchar](25) NOT NULL,
 CONSTRAINT [PK_ComponentsOnStaging] PRIMARY KEY CLUSTERED 
(
	[ComponentCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ContractsFinderContracts]    Script Date: 20-02-2017 11:25:26 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ContractsFinderContracts](
	[ContractId] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrder] [varchar](25) NOT NULL,
	[ContractTitle] [varchar](512) NOT NULL,
	[ContractUrl] [varchar](512) NOT NULL,
	[DocumentCategoryCode] [nchar](3) NOT NULL,
 CONSTRAINT [ContractsFinderContracts$pk] PRIMARY KEY CLUSTERED 
(
	[ContractId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[DocumentPublicationRules]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[DocumentPublicationRules](
	[DocumentPublicationRuleId] [int] NOT NULL,
	[ProjectStage] [int] NOT NULL,
	[ProjectMustBeApprovedPostCutOffDate] [bit] NOT NULL,
	[DocumentDate] [date] NOT NULL,
	[ContentType] [nvarchar](300) NOT NULL,
	[Singular] [bit] NOT NULL,
	[RestrictedToRecord] [bit] NOT NULL,
	[LanguageSpecific] [bit] NOT NULL,
	[PdfAllowed] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[DocumentPublicationStatus]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[DocumentPublicationStatus](
	[PublicationStatusID] [int] NOT NULL,
	[PublicationStatus] [varchar](15) NULL,
 CONSTRAINT [PK_DocumentPublicationStatus] PRIMARY KEY CLUSTERED 
(
	[PublicationStatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[EmergencyAidComponents]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[EmergencyAidComponents](
	[ComponentId] [varchar](25) NOT NULL,
 CONSTRAINT [EmergencyAidComponents$pk] PRIMARY KEY CLUSTERED 
(
	[ComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ExclusionAccount]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ExclusionAccount](
	[AccountCode] [varchar](25) NOT NULL,
	[ReplacementAccountName] [varchar](255) NULL,
 CONSTRAINT [ExclusionAccount$pk] PRIMARY KEY CLUSTERED 
(
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ExclusionBenefittingCountry]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ExclusionBenefittingCountry](
	[BenefittingCountryCode] [varchar](25) NOT NULL,
 CONSTRAINT [ExclusionBenefittingCountry$pk] PRIMARY KEY CLUSTERED 
(
	[BenefittingCountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ExclusionBudgetCentre]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ExclusionBudgetCentre](
	[BudgetCentreCode] [varchar](25) NOT NULL,
 CONSTRAINT [ExclusionBudgetCentre$pk] PRIMARY KEY CLUSTERED 
(
	[BudgetCentreCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ExclusionDetails]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ExclusionDetails](
	[ID] [nvarchar](12) NOT NULL,
	[Description] [nvarchar](500) NULL,
	[ParentProjectID] [nchar](10) NULL,
	[ParentProjectTitle] [nvarchar](400) NULL,
	[ExclusionType] [nvarchar](20) NOT NULL,
	[StartDate] [date] NULL,
	[EndDate] [date] NULL,
	[QuestApproveID] [nchar](7) NULL,
	[Department] [nvarchar](35) NULL,
	[ReasonForExclusion] [nvarchar](100) NULL,
	[Comments] [nvarchar](250) NULL,
	[Status] [nvarchar](10) NOT NULL,
	[StatusFinData] [nvarchar](25) NULL,
	[ExclusionLevel] [nvarchar](25) NULL,
	[ShowStatusToPRA] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ExclusionTransaction]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ExclusionTransaction](
	[ExclusionTransactionId] [int] IDENTITY(1,1) NOT NULL,
	[VoucherTypeCode] [varchar](25) NOT NULL,
	[VoucherNumber] [bigint] NULL,
	[SequenceNumber] [int] NULL,
	[TransactionKey] [bigint] NULL,
	[ReplacementSupplierName] [varchar](255) NULL,
 CONSTRAINT [ExclusionTransaction$pk] PRIMARY KEY CLUSTERED 
(
	[ExclusionTransactionId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [ExclusionTransaction$uq$VoucherTypeCode$VoucherNumber$SequenceNumber] UNIQUE NONCLUSTERED 
(
	[VoucherTypeCode] ASC,
	[VoucherNumber] ASC,
	[SequenceNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ExclusionVoucherType]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ExclusionVoucherType](
	[VoucherTypeCode] [varchar](25) NOT NULL,
	[ReplacementSupplierName] [varchar](255) NULL,
 CONSTRAINT [ExclusionVoucherType$pk] PRIMARY KEY CLUSTERED 
(
	[VoucherTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[LegacyDocuments]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[LegacyDocuments](
	[LegacyDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectNumber] [varchar](10) NOT NULL,
	[QuestID] [varchar](15) NOT NULL,
	[DocumentExtension] [varchar](8) NOT NULL,
	[Format] [varchar](128) NOT NULL,
	[Type] [varchar](50) NOT NULL,
	[IatiCode] [varchar](4) NOT NULL,
	[IatiTextDesc] [varchar](40) NOT NULL,
 CONSTRAINT [LegacyDocuments $pk] PRIMARY KEY CLUSTERED 
(
	[LegacyDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[LocationData]    Script Date: 20-02-2017 11:25:27 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[LocationData](
	[locationDataID] [int] IDENTITY(1,1) NOT NULL,
	[projectID] [int] NOT NULL,
	[@percentage] [int] NULL,
	[location-type/@xml:lang] [nchar](2) NULL,
	[location-type/@code] [nvarchar](255) NOT NULL,
	[location-type/@type] [nvarchar](255) NULL,
	[location-type/text()] [nvarchar](255) NULL,
	[name/@xml:lang] [nchar](2) NULL,
	[name/text()] [text] NULL,
	[description/@xml:lang] [nchar](2) NULL,
	[description/text()] [text] NULL,
	[administrative/@country] [nchar](2) NULL,
	[administrative/@adm1] [nvarchar](255) NULL,
	[administrative/@adm2] [nvarchar](255) NULL,
	[administrative/text()] [text] NULL,
	[coordinates/@latitude] [float] NULL,
	[coordinates/@longitude] [float] NULL,
	[coordinates/@precision] [int] NULL,
	[gazetteer-entry/@gazetteer-ref] [nvarchar](255) NULL,
	[gazetteer-entry/text()] [text] NULL,
 CONSTRAINT [LocationData$pk] PRIMARY KEY CLUSTERED 
(
	[locationDataID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[MappingAccount]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[MappingAccount](
	[MappingAccountID] [int] IDENTITY(1,1) NOT NULL,
	[AccountCode] [varchar](25) NOT NULL,
	[AccountName] [varchar](255) NOT NULL,
	[ReplacementAccountName] [varchar](255) NOT NULL,
	[IncludeExclude] [char](7) NOT NULL,
	[Comments] [varchar](255) NULL,
 CONSTRAINT [MappingAccount$pk] PRIMARY KEY CLUSTERED 
(
	[MappingAccountID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [MappingAccount$uq$AccountCode] UNIQUE NONCLUSTERED 
(
	[AccountCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [MappingAccount$uq$AccountName] UNIQUE NONCLUSTERED 
(
	[AccountName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[MappingBenefittingCountry]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[MappingBenefittingCountry](
	[BenefittingCountryCode] [varchar](25) NOT NULL,
	[BenefittingCountryTypeCode] [int] NOT NULL,
	[IATICountryCode] [nchar](2) NULL,
	[IATIRegionCode] [int] NULL,
 CONSTRAINT [MappingBenefittingCountry$pk] PRIMARY KEY CLUSTERED 
(
	[BenefittingCountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[MappingBenefittingCountryType]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[MappingBenefittingCountryType](
	[Code] [int] NOT NULL,
	[Name] [varchar](25) NULL,
 CONSTRAINT [MappingBenefittingCountryType$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY],
 CONSTRAINT [MappingBenefittingCountryType$uq$Name] UNIQUE NONCLUSTERED 
(
	[Name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[MappingDFIDRegionToDACRegion]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[MappingDFIDRegionToDACRegion](
	[BenefittingCountryCode] [varchar](25) NOT NULL,
	[DACRegionCode] [int] NOT NULL,
 CONSTRAINT [MappingDFIDRegionToDACRegion$pk] PRIMARY KEY CLUSTERED 
(
	[BenefittingCountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[MappingQuestContentType]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[MappingQuestContentType](
	[MappingQuestContentTypeID] [int] IDENTITY(1,1) NOT NULL,
	[QuestContentType] [varchar](150) NOT NULL,
	[IATIContentTypeCode] [nchar](3) NULL,
 CONSTRAINT [MappingQuestContentType$pk] PRIMARY KEY CLUSTERED 
(
	[MappingQuestContentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [MappingQuestContentType$uq$QuestContentType] UNIQUE NONCLUSTERED 
(
	[QuestContentType] ASC,
	[IATIContentTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[MappingQuestLanguage]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[MappingQuestLanguage](
	[MappingQuestLanguageID] [int] IDENTITY(1,1) NOT NULL,
	[QuestLanguage] [varchar](50) NOT NULL,
	[IATILanguageCode] [nchar](2) NULL,
 CONSTRAINT [MappingQuestLanguage$pk] PRIMARY KEY CLUSTERED 
(
	[MappingQuestLanguageID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [MappingQuestLanguage$uq$QuestLanguage] UNIQUE NONCLUSTERED 
(
	[QuestLanguage] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[MappingRecipientCountryBudgetIdentifier]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[MappingRecipientCountryBudgetIdentifier](
	[Code] [varchar](10) NOT NULL,
	[Sector] [varchar](25) NOT NULL,
 CONSTRAINT [MappingRecipientCountryBudgetIdentifier$pk] PRIMARY KEY CLUSTERED 
(
	[Code] ASC,
	[Sector] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[MappingVoucherType]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[MappingVoucherType](
	[MappingVoucherTypeID] [int] IDENTITY(1,1) NOT NULL,
	[VoucherTypeCode] [varchar](25) NOT NULL,
	[VoucherTypeName] [varchar](255) NOT NULL,
	[ReplacementVoucherTypeName] [varchar](255) NOT NULL,
 CONSTRAINT [MappingVoucherType$pk] PRIMARY KEY CLUSTERED 
(
	[MappingVoucherTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [MappingVoucherType$uq$VoucherTypeCode] UNIQUE NONCLUSTERED 
(
	[VoucherTypeCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY],
 CONSTRAINT [MappingVoucherType$uq$VoucherTypeName] UNIQUE NONCLUSTERED 
(
	[VoucherTypeName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[Population]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[Population](
	[PopulationId] [int] IDENTITY(1,1) NOT NULL,
	[ExportedFlag] [Configuration].[Flag] NOT NULL,
	[StartDateTime] [datetime] NOT NULL,
	[EndDateTime] [datetime] NULL,
	[SecondsForPopulation]  AS (datediff(second,[StartDateTime],[EndDateTime])),
	[VersionId] [Configuration].[Version] NOT NULL,
	[ActivitiesId] [int] NOT NULL,
	[DFIDOrganisationIdentifier] [nvarchar](255) NULL,
	[EarliestTransactionDate] [datetime] NULL,
	[LatestTransactionDate] [datetime] NULL,
	[MinimumTransactionAmount] [int] NULL,
	[ComponentSource] [sysname] NULL,
	[DocumentSource] [sysname] NULL,
 CONSTRAINT [Population$pk] PRIMARY KEY CLUSTERED 
(
	[PopulationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[PopulationComponent]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[PopulationComponent](
	[PopulationComponentId] [int] IDENTITY(1,1) NOT NULL,
	[PopulationId] [int] NOT NULL,
	[ComponentId] [varchar](25) NOT NULL,
	[StatusFinData] [nvarchar](20) NULL,
 CONSTRAINT [PopulationComponent$pk] PRIMARY KEY CLUSTERED 
(
	[PopulationComponentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ProjectOnStagingAudit]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ProjectOnStagingAudit](
	[MonthlyCycleStartTime] [datetime] NULL,
	[LastMonthlyProcessEndTime] [datetime] NULL,
	[LastDailyProcessEndTime] [datetime] NULL,
	[ProcessHoldByHUB] [bit] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[ProjectsOnStaging]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[ProjectsOnStaging](
	[ProjectCode] [nvarchar](12) NOT NULL,
	[DoNotPublish] [nvarchar](25) NULL,
	[StatusFinData] [nvarchar](25) NULL,
 CONSTRAINT [PK_ProjectsOnStaging_1] PRIMARY KEY CLUSTERED 
(
	[ProjectCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[PublishedDocuments]    Script Date: 20-02-2017 11:25:28 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[PublishedDocuments](
	[QuestID] [nchar](8) NOT NULL,
	[VersionNo] [smallint] NOT NULL,
	[DocType] [varchar](10) NULL,
	[ExtractionDate] [date] NULL,
	[PublicationStatusID] [smallint] NULL,
	[PublishedPermissionDate] [date] NULL,
	[ProjectID] [nchar](6) NOT NULL,
 CONSTRAINT [PK_PublishedDocuments] PRIMARY KEY CLUSTERED 
(
	[QuestID] ASC,
	[ProjectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[stageComponent]    Script Date: 20-02-2017 11:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[stageComponent](
	[ProjectCode] [nvarchar](8) NULL,
	[ComponentCode] [nvarchar](12) NOT NULL,
	[ComponentTitle] [nvarchar](max) NULL,
	[StartDate] [datetime] NULL,
	[EndDate] [datetime] NULL,
	[FundingTypeCode] [nvarchar](40) NULL,
	[PPIFundingTypeName] [nvarchar](40) NULL,
	[BudgetOriginal] [money] NULL,
	[InProcurement] [nvarchar](1) NULL,
	[StatusFinData] [nvarchar](20) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[SupplierInclusionList]    Script Date: 20-02-2017 11:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[SupplierInclusionList](
	[SupplierId] [varchar](25) NOT NULL,
 CONSTRAINT [SupplierInclusionList$pk] PRIMARY KEY CLUSTERED 
(
	[SupplierId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 80) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [PublicationControl].[UnfilteredTransactions]    Script Date: 20-02-2017 11:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [PublicationControl].[UnfilteredTransactions](
	[iati-activityID] [int] NOT NULL,
	[account] [varchar](25) NOT NULL,
	[amount] [decimal](28, 3) NOT NULL,
	[apar_id] [varchar](25) NOT NULL,
	[apar_type] [char](1) NOT NULL,
	[client] [varchar](25) NOT NULL,
	[cur_amount] [decimal](28, 3) NOT NULL,
	[currency] [varchar](25) NOT NULL,
	[dc_flag] [smallint] NOT NULL,
	[description] [varchar](255) NOT NULL,
	[dim_1] [varchar](25) NOT NULL,
	[dim_4] [varchar](25) NOT NULL,
	[dim_7] [varchar](25) NOT NULL,
	[ext_inv_ref] [varchar](100) NOT NULL,
	[ext_ref] [varchar](255) NOT NULL,
	[fiscal_year] [int] NOT NULL,
	[last_update] [datetime] NOT NULL,
	[order_id] [bigint] NOT NULL,
	[period] [int] NOT NULL,
	[sequence_no] [int] NOT NULL,
	[status] [char](1) NOT NULL,
	[tax_code] [varchar](25) NOT NULL,
	[tax_system] [varchar](25) NOT NULL,
	[trans_date] [datetime] NOT NULL,
	[trans_id] [bigint] NOT NULL,
	[user_id] [varchar](25) NOT NULL,
	[voucher_date] [datetime] NOT NULL,
	[voucher_no] [bigint] NOT NULL,
	[voucher_type] [varchar](25) NOT NULL,
	[agrtid] [bigint] NOT NULL,
	[IsExpenditureAccount] [varchar](1) NOT NULL,
	[IsIncludedAccount] [varchar](1) NOT NULL,
	[IsProvisionRelated] [varchar](1) NOT NULL,
	[IsProcurementExcluded] [varchar](1) NOT NULL,
	[IsProjectExcluded] [varchar](1) NOT NULL,
	[IsComponentExcluded] [varchar](1) NOT NULL,
	[IsAccountExcluded] [varchar](1) NOT NULL,
	[IsVoucherTypeExcluded] [varchar](1) NOT NULL,
	[IsBudgetCentreExcluded] [varchar](1) NOT NULL,
	[IsBenefittingCountryExcluded] [varchar](1) NOT NULL,
	[IsTransactionExcluded] [varchar](1) NOT NULL,
	[IsSupplierExcluded] [varchar](1) NOT NULL,
	[IsDateExcluded] [varchar](1) NOT NULL,
	[IsTransactionLineAmountExcluded] [varchar](1) NOT NULL,
	[TransactionTotal] [decimal](38, 3) NULL,
	[IsGreaterThan25K] [varchar](1) NOT NULL,
	[SupplierName] [varchar](255) NULL,
	[CustomerName] [varchar](255) NULL,
	[IATIAmount] [decimal](28, 3) NOT NULL,
	[IATIAccountName] [varchar](255) NULL,
	[IATIChannelCode] [varchar](25) NULL,
	[IATICustomerSupplier] [varchar](255) NULL,
	[IsIncluded] [varchar](1) NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [UM].[Aidtype]    Script Date: 20-02-2017 11:25:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UM].[Aidtype](
	[aidtype_code] [nvarchar](255) NULL,
	[aidtype_name_uk] [nvarchar](255) NULL,
	[parent_code] [nvarchar](1) NULL,
	[parent_name_uk] [nvarchar](255) NULL,
	[aidtype_name_dk] [nvarchar](255) NULL,
	[parent_name_dk] [nvarchar](255) NULL,
	[ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [UM].[Channel]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UM].[Channel](
	[channel_code] [int] NULL,
	[channel_category_code] [int] NULL,
	[channel_name_uk] [varchar](200) NULL,
	[channel_name_dk] [varchar](212) NULL,
	[ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [UM].[Currency]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UM].[Currency](
	[Year] [int] NULL,
	[CurrencyCode] [varchar](10) NULL,
	[ExchRate] [int] NULL,
	[ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [UM].[Finanslov]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UM].[Finanslov](
	[SubCompanyCode] [int] NULL,
	[BudgetSubSection] [nvarchar](25) NULL,
	[BudgetSubSection_Name_UK] [nvarchar](250) NULL,
	[BudgetSubSection_Name_DK] [nvarchar](250) NULL,
	[BudgetSection] [nvarchar](25) NULL,
	[BudgetSection_Name_DK] [nvarchar](250) NULL,
	[BudgetSection_Name_UK] [nvarchar](250) NULL,
	[BudgetGroup] [nvarchar](25) NULL,
	[BudgetGroup_Name_UK] [nvarchar](250) NULL,
	[BudgetGroup_Name_DK] [nvarchar](250) NULL,
	[Category1_DK] [varchar](100) NOT NULL,
	[Category1_UK] [varchar](100) NOT NULL,
	[Category2_DK] [varchar](100) NULL,
	[Category2_UK] [varchar](100) NULL,
	[ID] [int] NOT NULL
) ON [PRIMARY]

GO
/****** Object:  Table [UM].[Organisation]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UM].[Organisation](
	[organisation_code] [int] NULL,
	[organisation_name_uk] [varchar](120) NULL,
	[organisation_name_dk] [varchar](132) NULL,
	[ID] [int] NOT NULL,
	[channel_code] [int] NULL
) ON [PRIMARY]

GO
/****** Object:  Table [UM].[Sector]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [UM].[Sector](
	[sector_code] [int] NULL,
	[sector_name_uk] [nvarchar](255) NULL,
	[category_code] [int] NULL,
	[category_name_uk] [nvarchar](255) NULL,
	[parent_code] [nvarchar](255) NULL,
	[parent_name_uk] [nvarchar](255) NULL,
	[sector_name_dk] [nvarchar](255) NULL,
	[category_name_dk] [nvarchar](255) NULL,
	[parent_name_dk] [nvarchar](255) NULL,
	[ID] [int] NOT NULL
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_DAC5DigitSector_8_1221579390__K1_2]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_DAC5DigitSector_8_1221579390__K1_2] ON [Codelist].[DAC5DigitSector]
(
	[Code] ASC
)
INCLUDE ( 	[Name]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_activity/description_8_434100587__K2_3_4_5]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_activity/description_8_434100587__K2_3_4_5] ON [IATISchema].[activity/description]
(
	[iati-activityID] ASC
)
INCLUDE ( 	[@xml:lang],
	[@type],
	[text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_activity/title_8_466100701__K2_3_4]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_activity/title_8_466100701__K2_3_4] ON [IATISchema].[activity/title]
(
	[iati-activityID] ASC
)
INCLUDE ( 	[@xml:lang],
	[text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_activity-date_8_498100815__K2_3_5]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_activity-date_8_498100815__K2_3_5] ON [IATISchema].[activity-date]
(
	[iati-activityID] ASC
)
INCLUDE ( 	[@type],
	[@iso-date]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_budget_8_530100929__K2_K4_3_5_6_7_8_9_10]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_budget_8_530100929__K2_K4_3_5_6_7_8_9_10] ON [IATISchema].[budget]
(
	[iati-activityID] ASC,
	[period-start/@iso-date] ASC
)
INCLUDE ( 	[@type],
	[period-start/text()],
	[period-end/@iso-date],
	[period-end/text()],
	[value/@currency],
	[value/@value-date],
	[value/text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_contact-info_8_690101499__K2_K1_3_5]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_contact-info_8_690101499__K2_K1_3_5] ON [IATISchema].[contact-info]
(
	[iati-activityID] ASC,
	[contact-infoID] ASC
)
INCLUDE ( 	[organisation/text()],
	[person-name/text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_contact-info/details_8_722101613__K2_3_4_5]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_contact-info/details_8_722101613__K2_3_4_5] ON [IATISchema].[contact-info/details]
(
	[contact-infoID] ASC
)
INCLUDE ( 	[telephone/text()],
	[email/text()],
	[mailing-address/text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_iati-activity_8_850102069__K3_K4_K6_K1_K42_K26_K22_K18_K14_K30_8_9_10_11_12_13_15_17_19_20_23_24_27_28_31_32_33_34_]    Script Date: 20-02-2017 11:25:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [_dta_index_iati-activity_8_850102069__K3_K4_K6_K1_K42_K26_K22_K18_K14_K30_8_9_10_11_12_13_15_17_19_20_23_24_27_28_31_32_33_34_] ON [IATISchema].[iati-activity]
(
	[ProjectId] ASC,
	[ComponentId] ASC,
	[CountryCode] ASC,
	[iati-activityID] ASC,
	[default-tied-status/@code] ASC,
	[default-aid-type/@code] ASC,
	[default-flow-type/@code] ASC,
	[collaboration-type/@code] ASC,
	[reporting-org/@ref] ASC,
	[default-finance-type/@code] ASC
)
INCLUDE ( 	[@version],
	[@last-updated-datetime],
	[activity-status/@xml:lang],
	[activity-status/@code],
	[activity-status/@type],
	[default-tied-status/@type],
	[default-tied-status/text()],
	[default-finance-type/@type],
	[default-finance-type/text()],
	[iati-identifier/text()],
	[other-identifier/@owner-ref],
	[other-identifier/@owner-name],
	[other-identifier/text()],
	[collaboration-type/@type],
	[collaboration-type/text()],
	[default-flow-type/@type],
	[default-flow-type/text()],
	[default-aid-type/@type],
	[default-aid-type/text()],
	[@xml:lang],
	[@default-currency],
	[@hierarchy],
	[reporting-org/@xml:lang],
	[reporting-org/@type],
	[collaboration-type/@xml:lang]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_iati-activity_8_850102069__K4_K1_K3_K6]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_iati-activity_8_850102069__K4_K1_K3_K6] ON [IATISchema].[iati-activity]
(
	[ComponentId] ASC,
	[iati-activityID] ASC,
	[ProjectId] ASC,
	[CountryCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_iati-activity_8_850102069__K4_K3_1]    Script Date: 20-02-2017 11:25:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [_dta_index_iati-activity_8_850102069__K4_K3_1] ON [IATISchema].[iati-activity]
(
	[ComponentId] ASC,
	[ProjectId] ASC
)
INCLUDE ( 	[iati-activityID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_iati-activity_8_850102069__K4_K7_K3_K5_K6_1_2]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_iati-activity_8_850102069__K4_K7_K3_K5_K6_1_2] ON [IATISchema].[iati-activity]
(
	[ComponentId] ASC,
	[RegionCode] ASC,
	[ProjectId] ASC,
	[BenefittingCountryCode] ASC,
	[CountryCode] ASC
)
INCLUDE ( 	[iati-activityID],
	[iati-activitiesID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_iati-activity]    Script Date: 20-02-2017 11:25:30 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_iati-activity] ON [IATISchema].[iati-activity]
(
	[ProjectId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_other-identifier_8_230291880__K3_4_5_6_8]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_other-identifier_8_230291880__K3_4_5_6_8] ON [IATISchema].[other-identifier]
(
	[ActivityId] ASC
)
INCLUDE ( 	[@owner-ref],
	[@owner-name],
	[text()],
	[@type]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_participating-org_8_1074102867__K2_K4_3_5_6_7]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_participating-org_8_1074102867__K2_K4_3_5_6_7] ON [IATISchema].[participating-org]
(
	[iati-activityID] ASC,
	[@ref] ASC
)
INCLUDE ( 	[@xml:lang],
	[@type],
	[@role],
	[text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_recipient-country_8_1138103095__K2_3_4_5_6]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_recipient-country_8_1138103095__K2_3_4_5_6] ON [IATISchema].[recipient-country]
(
	[iati-activityID] ASC
)
INCLUDE ( 	[@code],
	[@type],
	[@xml:lang],
	[@percentage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_recipient-country_8_1138103095__K2_3_6]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_recipient-country_8_1138103095__K2_3_6] ON [IATISchema].[recipient-country]
(
	[iati-activityID] ASC
)
INCLUDE ( 	[@code],
	[@percentage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_recipient-country_8_1138103095__K2_K1_K3_4_5_6_7]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_recipient-country_8_1138103095__K2_K1_K3_4_5_6_7] ON [IATISchema].[recipient-country]
(
	[iati-activityID] ASC,
	[recipient-countryID] ASC,
	[@code] ASC
)
INCLUDE ( 	[@type],
	[@xml:lang],
	[@percentage],
	[text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_recipient-region_8_1170103209__K2_3_6]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_recipient-region_8_1170103209__K2_3_6] ON [IATISchema].[recipient-region]
(
	[iati-activityID] ASC
)
INCLUDE ( 	[@code],
	[@percentage]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_recipient-region_8_1170103209__K2_K1_K3_4_5_6_7]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_recipient-region_8_1170103209__K2_K1_K3_4_5_6_7] ON [IATISchema].[recipient-region]
(
	[iati-activityID] ASC,
	[recipient-regionID] ASC,
	[@code] ASC
)
INCLUDE ( 	[@type],
	[@xml:lang],
	[@percentage],
	[text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_related-activity_8_1202103323__K2_K1_K5_3_4_6]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_related-activity_8_1202103323__K2_K1_K5_3_4_6] ON [IATISchema].[related-activity]
(
	[iati-activityID] ASC,
	[related-activityID] ASC,
	[@type] ASC
)
INCLUDE ( 	[@xml:lang],
	[@ref],
	[text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_related-activity_8_1202103323__K2_K5_3_4]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_related-activity_8_1202103323__K2_K5_3_4] ON [IATISchema].[related-activity]
(
	[iati-activityID] ASC,
	[@type] ASC
)
INCLUDE ( 	[@xml:lang],
	[@ref]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_related-activity_8_1202103323__K2_K5_4]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_related-activity_8_1202103323__K2_K5_4] ON [IATISchema].[related-activity]
(
	[iati-activityID] ASC,
	[@type] ASC
)
INCLUDE ( 	[@ref]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_result_8_797245895__K3_K1_K2_4_6_9_10]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_result_8_797245895__K3_K1_K2_4_6_9_10] ON [IATISchema].[result]
(
	[ActivityId] ASC,
	[Id] ASC,
	[iati-activitiesId] ASC
)
INCLUDE ( 	[@type],
	[title/text()],
	[description/text()],
	[@aggregation-status]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_result/indicator_8_829246009__K2_K1_3_5_8_9_10_12_13]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_result/indicator_8_829246009__K2_K1_3_5_8_9_10_12_13] ON [IATISchema].[result/indicator]
(
	[resultId] ASC,
	[Id] ASC
)
INCLUDE ( 	[@measure],
	[title/text()],
	[description/text()],
	[baseline/@year],
	[baseline/@value],
	[baseline/text()],
	[@ascending]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [_dta_index_result/indicator/period_8_1149247149__K4_K1_2_3]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_result/indicator/period_8_1149247149__K4_K1_2_3] ON [IATISchema].[result/indicator/period]
(
	[result/indicatorId] ASC,
	[Id] ASC
)
INCLUDE ( 	[period-start/@iso-date],
	[period-end/@iso-date]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_result/indicator/target_8_1053246807__K7_1_4]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_result/indicator/target_8_1053246807__K7_1_4] ON [IATISchema].[result/indicator/target]
(
	[result/indicator/periodId] ASC
)
INCLUDE ( 	[Id],
	[@value]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_sector_8_1234103437__K2_K1_K4_K7_K8_3_5_6_9]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_sector_8_1234103437__K2_K1_K4_K7_K8_3_5_6_9] ON [IATISchema].[sector]
(
	[iati-activityID] ASC,
	[sectorID] ASC,
	[@code] ASC,
	[@vocabulary] ASC,
	[@percentage] ASC
)
INCLUDE ( 	[@xml:lang],
	[@type],
	[@other-code],
	[text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_sector_8_1234103437__K2_K4_K7_K8_3_6_9]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_sector_8_1234103437__K2_K4_K7_K8_3_6_9] ON [IATISchema].[sector]
(
	[iati-activityID] ASC,
	[@code] ASC,
	[@vocabulary] ASC,
	[@percentage] ASC
)
INCLUDE ( 	[@xml:lang],
	[@other-code],
	[text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_transaction_8_1266103551__K2_K1_K47_K43_K35_K31_5_6_8_9_11_12_13_14_16_17_18_19_20_21_22_23_24_25_26_27_28_32_33_34_]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_transaction_8_1266103551__K2_K1_K47_K43_K35_K31_5_6_8_9_11_12_13_14_16_17_18_19_20_21_22_23_24_25_26_27_28_32_33_34_] ON [IATISchema].[transaction]
(
	[iati-activityID] ASC,
	[transactionID] ASC,
	[disbursement-channel/@code] ASC,
	[tied-status/@code] ASC,
	[aid-type/@code] ASC,
	[flow-type/@code] ASC
)
INCLUDE ( 	[@ref],
	[@type],
	[value/@currency],
	[value/@value-date],
	[value/text()],
	[transaction-type/@xml:lang],
	[transaction-type/@code],
	[transaction-type/@type],
	[provider-org/@xml:lang],
	[provider-org/@ref],
	[provider-org/@type],
	[provider-org/@provider-activity-id],
	[provider-org/text()],
	[receiver-org/@xml:lang],
	[receiver-org/@ref],
	[receiver-org/@type],
	[receiver-org/@receiver-activity-id],
	[receiver-org/text()],
	[description/@xml:lang],
	[description/text()],
	[transaction-date/@iso-date],
	[flow-type/@type],
	[flow-type/text()],
	[aid-type/@xml:lang],
	[aid-type/@type],
	[aid-type/text()],
	[finance-type/@xml:lang],
	[finance-type/@code],
	[finance-type/@type],
	[finance-type/text()],
	[tied-status/@xml:lang],
	[tied-status/@type],
	[tied-status/text()],
	[disbursement-channel/@xml:lang],
	[disbursement-channel/@type],
	[disbursement-channel/text()]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [_dta_index_transaction_8_1266103551__K2_K17_5_8_9_11_13_19_20_22_24_25_26_27_28_31_35_39_43_47]    Script Date: 20-02-2017 11:25:30 ******/
CREATE NONCLUSTERED INDEX [_dta_index_transaction_8_1266103551__K2_K17_5_8_9_11_13_19_20_22_24_25_26_27_28_31_35_39_43_47] ON [IATISchema].[transaction]
(
	[iati-activityID] ASC,
	[provider-org/@ref] ASC
)
INCLUDE ( 	[@ref],
	[value/@currency],
	[value/@value-date],
	[value/text()],
	[receiver-org/@receiver-activity-id],
	[receiver-org/text()],
	[aid-type/@code],
	[finance-type/@code],
	[transaction-type/@code],
	[provider-org/@provider-activity-id],
	[provider-org/text()],
	[receiver-org/@ref],
	[tied-status/@code],
	[disbursement-channel/@code],
	[description/@xml:lang],
	[description/text()],
	[transaction-date/@iso-date],
	[flow-type/@code]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Codelist].[FileFormat] ADD  DEFAULT ('') FOR [Category]
GO
ALTER TABLE [Codelist].[GeographicalPrecision] ADD  DEFAULT ('') FOR [Name]
GO
ALTER TABLE [Codelist].[LocationType] ADD  DEFAULT ('') FOR [Category]
GO
ALTER TABLE [Configuration].[Error] ADD  DEFAULT (getdate()) FOR [Date]
GO
ALTER TABLE [Configuration].[Error] ADD  DEFAULT (original_login()) FOR [Login]
GO
ALTER TABLE [IATISchema].[country-budget-items] ADD  DEFAULT ('1') FOR [@vocabulary]
GO
ALTER TABLE [IATISchema].[iati-activities] ADD  DEFAULT ((1.03)) FOR [@version]
GO
ALTER TABLE [IATISchema].[iati-activities] ADD  DEFAULT (getdate()) FOR [@generated-datetime]
GO
ALTER TABLE [IATISchema].[iati-activities] ADD  DEFAULT ('en') FOR [ir:registry-record/@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity] ADD  DEFAULT ('en') FOR [@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity] ADD  DEFAULT ('GBP') FOR [@default-currency]
GO
ALTER TABLE [IATISchema].[policy-marker] ADD  DEFAULT ('DAC') FOR [@vocabulary]
GO
ALTER TABLE [PublicationControl].[ComponentsOnStaging] ADD  CONSTRAINT [DF_ComponentsOnStaging_DateFirstReleased]  DEFAULT (getdate()) FOR [DateFirstReleased]
GO
ALTER TABLE [PublicationControl].[ComponentsOnStaging] ADD  CONSTRAINT [DF_ComponentsOnStaging_Status]  DEFAULT ('AwaitingPublication') FOR [Status]
GO
ALTER TABLE [PublicationControl].[ComponentsOnStaging] ADD  CONSTRAINT [DF_ComponentsOnStaging_StatusFinData]  DEFAULT ('Release') FOR [StatusFinData]
GO
ALTER TABLE [PublicationControl].[ExclusionDetails] ADD  DEFAULT ((1)) FOR [ShowStatusToPRA]
GO
ALTER TABLE [PublicationControl].[Population] ADD  CONSTRAINT [DF_Population_ExportedFlag]  DEFAULT ('N') FOR [ExportedFlag]
GO
ALTER TABLE [PublicationControl].[ProjectsOnStaging] ADD  CONSTRAINT [DF_ProjectsOnStaging_DoNotPublish]  DEFAULT ('n') FOR [DoNotPublish]
GO
ALTER TABLE [PublicationControl].[ProjectsOnStaging] ADD  CONSTRAINT [DF_ProjectsOnStaging_DoNotPublishFinData]  DEFAULT ('Release') FOR [StatusFinData]
GO
ALTER TABLE [Codelist].[AidType]  WITH NOCHECK ADD  CONSTRAINT [AidType$fk$Category] FOREIGN KEY([CategoryCode])
REFERENCES [Codelist].[AidTypeCategory] ([Code])
GO
ALTER TABLE [Codelist].[AidType] NOCHECK CONSTRAINT [AidType$fk$Category]
GO
ALTER TABLE [Codelist].[DAC5DigitSector]  WITH NOCHECK ADD  CONSTRAINT [Secot$fk$Category] FOREIGN KEY([CategoryCode])
REFERENCES [Codelist].[SectorCategory] ([Code])
GO
ALTER TABLE [Codelist].[DAC5DigitSector] NOCHECK CONSTRAINT [Secot$fk$Category]
GO
ALTER TABLE [Codelist].[DocumentCategory]  WITH NOCHECK ADD  CONSTRAINT [DocumentContentType$fk$Category] FOREIGN KEY([CategoryCode])
REFERENCES [Codelist].[DocumentCategoryCategory] ([Code])
GO
ALTER TABLE [Codelist].[DocumentCategory] NOCHECK CONSTRAINT [DocumentContentType$fk$Category]
GO
ALTER TABLE [Codelist].[FinanceType]  WITH NOCHECK ADD  CONSTRAINT [FinanceType$fk$Category] FOREIGN KEY([Category])
REFERENCES [Codelist].[FinanceTypeCategory] ([Code])
GO
ALTER TABLE [Codelist].[FinanceType] NOCHECK CONSTRAINT [FinanceType$fk$Category]
GO
ALTER TABLE [Codelist].[LocationType]  WITH NOCHECK ADD  CONSTRAINT [LocationType$fk$Category] FOREIGN KEY([Category])
REFERENCES [Codelist].[LocationTypeCategory] ([Code])
GO
ALTER TABLE [Codelist].[LocationType] NOCHECK CONSTRAINT [LocationType$fk$Category]
GO
ALTER TABLE [Codelist].[OrganisationRegistrationAgency]  WITH NOCHECK ADD  CONSTRAINT [OrganisationRegistrationAgency$fk$Category] FOREIGN KEY([Category])
REFERENCES [Codelist].[Country] ([Code])
GO
ALTER TABLE [Codelist].[OrganisationRegistrationAgency] NOCHECK CONSTRAINT [OrganisationRegistrationAgency$fk$Category]
GO
ALTER TABLE [Codelist].[SectorCategory]  WITH NOCHECK ADD  CONSTRAINT [SectorCategory$fk$ParentCategory] FOREIGN KEY([ParentCode])
REFERENCES [Codelist].[SectorCategory] ([Code])
GO
ALTER TABLE [Codelist].[SectorCategory] NOCHECK CONSTRAINT [SectorCategory$fk$ParentCategory]
GO
ALTER TABLE [IATISchema].[activity/description]  WITH NOCHECK ADD  CONSTRAINT [activity/description$fk$@type] FOREIGN KEY([@type])
REFERENCES [Codelist].[DescriptionType] ([Code])
GO
ALTER TABLE [IATISchema].[activity/description] NOCHECK CONSTRAINT [activity/description$fk$@type]
GO
ALTER TABLE [IATISchema].[activity/description]  WITH NOCHECK ADD  CONSTRAINT [activity/description$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[activity/description] NOCHECK CONSTRAINT [activity/description$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[activity/description]  WITH NOCHECK ADD  CONSTRAINT [activity/description$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[activity/description] NOCHECK CONSTRAINT [activity/description$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[activity/title]  WITH NOCHECK ADD  CONSTRAINT [activity/title$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[activity/title] NOCHECK CONSTRAINT [activity/title$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[activity/title]  WITH NOCHECK ADD  CONSTRAINT [activity/title$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[activity/title] NOCHECK CONSTRAINT [activity/title$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[activity-date]  WITH NOCHECK ADD  CONSTRAINT [activity-date$fk$@type] FOREIGN KEY([@type])
REFERENCES [Codelist].[ActivityDateType] ([Code])
GO
ALTER TABLE [IATISchema].[activity-date] NOCHECK CONSTRAINT [activity-date$fk$@type]
GO
ALTER TABLE [IATISchema].[activity-date]  WITH NOCHECK ADD  CONSTRAINT [activity-date$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[activity-date] NOCHECK CONSTRAINT [activity-date$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[activity-date]  WITH NOCHECK ADD  CONSTRAINT [activity-date$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[activity-date] NOCHECK CONSTRAINT [activity-date$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[activity-humanitarian-scope]  WITH CHECK ADD  CONSTRAINT [FK_activity-humanitarian-scope_iati-activity] FOREIGN KEY([iati-activityId])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[activity-humanitarian-scope] CHECK CONSTRAINT [FK_activity-humanitarian-scope_iati-activity]
GO
ALTER TABLE [IATISchema].[activity-scope]  WITH CHECK ADD  CONSTRAINT [FK_activity-scope_ActivityScope] FOREIGN KEY([@code])
REFERENCES [Codelist].[ActivityScope] ([Code])
GO
ALTER TABLE [IATISchema].[activity-scope] CHECK CONSTRAINT [FK_activity-scope_ActivityScope]
GO
ALTER TABLE [IATISchema].[activity-scope]  WITH CHECK ADD  CONSTRAINT [FK_activity-scope_activity-scope] FOREIGN KEY([activity-scopeId])
REFERENCES [IATISchema].[activity-scope] ([activity-scopeId])
GO
ALTER TABLE [IATISchema].[activity-scope] CHECK CONSTRAINT [FK_activity-scope_activity-scope]
GO
ALTER TABLE [IATISchema].[activity-scope]  WITH CHECK ADD  CONSTRAINT [FK_activity-scope_iati-activity] FOREIGN KEY([iati-activityId])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON UPDATE CASCADE
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[activity-scope] CHECK CONSTRAINT [FK_activity-scope_iati-activity]
GO
ALTER TABLE [IATISchema].[activity-scope]  WITH CHECK ADD  CONSTRAINT [FK_IATISchema]].[activity-scope_IATISchema]].[activity-scope] FOREIGN KEY([activity-scopeId])
REFERENCES [IATISchema].[activity-scope] ([activity-scopeId])
GO
ALTER TABLE [IATISchema].[activity-scope] CHECK CONSTRAINT [FK_IATISchema]].[activity-scope_IATISchema]].[activity-scope]
GO
ALTER TABLE [IATISchema].[budget]  WITH NOCHECK ADD  CONSTRAINT [budget$fk$@type] FOREIGN KEY([@type])
REFERENCES [Codelist].[BudgetType] ([Name])
GO
ALTER TABLE [IATISchema].[budget] NOCHECK CONSTRAINT [budget$fk$@type]
GO
ALTER TABLE [IATISchema].[budget]  WITH NOCHECK ADD  CONSTRAINT [budget$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[budget] NOCHECK CONSTRAINT [budget$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[budget]  WITH NOCHECK ADD  CONSTRAINT [budget$fk$value/@currency] FOREIGN KEY([value/@currency])
REFERENCES [Codelist].[Currency] ([Code])
GO
ALTER TABLE [IATISchema].[budget] NOCHECK CONSTRAINT [budget$fk$value/@currency]
GO
ALTER TABLE [IATISchema].[capital-spend]  WITH NOCHECK ADD  CONSTRAINT [capital-spend$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[capital-spend] NOCHECK CONSTRAINT [capital-spend$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[collaboration-type]  WITH NOCHECK ADD  CONSTRAINT [collaboration-type$fk$@code] FOREIGN KEY([@code])
REFERENCES [Codelist].[CollaborationType] ([Code])
GO
ALTER TABLE [IATISchema].[collaboration-type] NOCHECK CONSTRAINT [collaboration-type$fk$@code]
GO
ALTER TABLE [IATISchema].[collaboration-type]  WITH NOCHECK ADD  CONSTRAINT [collaboration-type$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[collaboration-type] NOCHECK CONSTRAINT [collaboration-type$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[collaboration-type]  WITH NOCHECK ADD  CONSTRAINT [collaboration-type$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[collaboration-type] NOCHECK CONSTRAINT [collaboration-type$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[conditions]  WITH NOCHECK ADD  CONSTRAINT [conditions$fk$@attached] FOREIGN KEY([@attached])
REFERENCES [Codelist].[ConditionsAttached_ToBeRemoved] ([Code])
GO
ALTER TABLE [IATISchema].[conditions] NOCHECK CONSTRAINT [conditions$fk$@attached]
GO
ALTER TABLE [IATISchema].[conditions/condition]  WITH NOCHECK ADD  CONSTRAINT [conditions/condition$fk$conditionsID] FOREIGN KEY([conditionsID])
REFERENCES [IATISchema].[conditions] ([conditionsID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[conditions/condition] NOCHECK CONSTRAINT [conditions/condition$fk$conditionsID]
GO
ALTER TABLE [IATISchema].[conditions/condition]  WITH NOCHECK ADD  CONSTRAINT [conditions/condition$fk$value/@type] FOREIGN KEY([@type])
REFERENCES [Codelist].[ConditionType] ([Code])
GO
ALTER TABLE [IATISchema].[conditions/condition] NOCHECK CONSTRAINT [conditions/condition$fk$value/@type]
GO
ALTER TABLE [IATISchema].[contact-info]  WITH NOCHECK ADD  CONSTRAINT [contact-info$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[contact-info] NOCHECK CONSTRAINT [contact-info$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[contact-info]  WITH NOCHECK ADD  CONSTRAINT [contact-info$fk$person-name/@xml:lang] FOREIGN KEY([person-name/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[contact-info] NOCHECK CONSTRAINT [contact-info$fk$person-name/@xml:lang]
GO
ALTER TABLE [IATISchema].[contact-info/details]  WITH NOCHECK ADD  CONSTRAINT [contact-info/details$fk$contact-infoID] FOREIGN KEY([contact-infoID])
REFERENCES [IATISchema].[contact-info] ([contact-infoID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[contact-info/details] NOCHECK CONSTRAINT [contact-info/details$fk$contact-infoID]
GO
ALTER TABLE [IATISchema].[country-budget-items]  WITH NOCHECK ADD  CONSTRAINT [country-budget-items$fk$@vocabulary] FOREIGN KEY([@vocabulary])
REFERENCES [Codelist].[BudgetIdentifierVocabulary] ([Code])
GO
ALTER TABLE [IATISchema].[country-budget-items] NOCHECK CONSTRAINT [country-budget-items$fk$@vocabulary]
GO
ALTER TABLE [IATISchema].[country-budget-items/budget-item]  WITH CHECK ADD  CONSTRAINT [country-budget-items/budget-item$fk$@code] FOREIGN KEY([@code])
REFERENCES [Codelist].[BudgetIdentifier] ([Code])
GO
ALTER TABLE [IATISchema].[country-budget-items/budget-item] CHECK CONSTRAINT [country-budget-items/budget-item$fk$@code]
GO
ALTER TABLE [IATISchema].[country-budget-items/budget-item]  WITH CHECK ADD  CONSTRAINT [country-budget-items/budget-item$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[country-budget-items/budget-item] CHECK CONSTRAINT [country-budget-items/budget-item$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[country-budget-items/budget-item]  WITH CHECK ADD  CONSTRAINT [country-budget-items/budget-item$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[country-budget-items/budget-item] CHECK CONSTRAINT [country-budget-items/budget-item$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[iati-activities]  WITH NOCHECK ADD  CONSTRAINT [iati-activities$fk$@ir:registry-record/publisher-role] FOREIGN KEY([ir:registry-record/@publisher-role])
REFERENCES [Codelist].[OrganisationRole] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activities] NOCHECK CONSTRAINT [iati-activities$fk$@ir:registry-record/publisher-role]
GO
ALTER TABLE [IATISchema].[iati-activities]  WITH NOCHECK ADD  CONSTRAINT [iati-activities$fk$ir:registry-record/@donor-country] FOREIGN KEY([ir:registry-record/@donor-country])
REFERENCES [Codelist].[Country] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activities] NOCHECK CONSTRAINT [iati-activities$fk$ir:registry-record/@donor-country]
GO
ALTER TABLE [IATISchema].[iati-activities]  WITH NOCHECK ADD  CONSTRAINT [iati-activities$fk$ir:registry-record/@donor-id] FOREIGN KEY([ir:registry-record/@donor-id])
REFERENCES [Codelist].[OrganisationIdentifier] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activities] NOCHECK CONSTRAINT [iati-activities$fk$ir:registry-record/@donor-id]
GO
ALTER TABLE [IATISchema].[iati-activities]  WITH NOCHECK ADD  CONSTRAINT [iati-activities$fk$ir:registry-record/@donor-type] FOREIGN KEY([ir:registry-record/@donor-type])
REFERENCES [Codelist].[OrganisationType] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activities] NOCHECK CONSTRAINT [iati-activities$fk$ir:registry-record/@donor-type]
GO
ALTER TABLE [IATISchema].[iati-activities]  WITH NOCHECK ADD  CONSTRAINT [iati-activities$fk$ir:registry-record/@format] FOREIGN KEY([ir:registry-record/@format])
REFERENCES [Codelist].[FileFormat] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activities] NOCHECK CONSTRAINT [iati-activities$fk$ir:registry-record/@format]
GO
ALTER TABLE [IATISchema].[iati-activities]  WITH NOCHECK ADD  CONSTRAINT [iati-activities$fk$ir:registry-record/@publisher-id] FOREIGN KEY([ir:registry-record/@publisher-id])
REFERENCES [Codelist].[OrganisationIdentifier] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activities] NOCHECK CONSTRAINT [iati-activities$fk$ir:registry-record/@publisher-id]
GO
ALTER TABLE [IATISchema].[iati-activities]  WITH NOCHECK ADD  CONSTRAINT [iati-activities$fk$ir:registry-record/@verification-status] FOREIGN KEY([ir:registry-record/@verification-status])
REFERENCES [Codelist].[VerificationStatus] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activities] NOCHECK CONSTRAINT [iati-activities$fk$ir:registry-record/@verification-status]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$activity-status/@code] FOREIGN KEY([activity-status/@code])
REFERENCES [Codelist].[ActivityStatus] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$activity-status/@code]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$activity-status/@xml:lang] FOREIGN KEY([activity-status/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$activity-status/@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$collaboration-type/@code] FOREIGN KEY([collaboration-type/@code])
REFERENCES [Codelist].[CollaborationType] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$collaboration-type/@code]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$collaboration-type/@xml:lang] FOREIGN KEY([collaboration-type/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$collaboration-type/@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$CountryCode] FOREIGN KEY([CountryCode])
REFERENCES [Codelist].[Country] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$CountryCode]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$default-aid-type/@code] FOREIGN KEY([default-aid-type/@code])
REFERENCES [Codelist].[AidType] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$default-aid-type/@code]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$default-aid-type/@xml:lang] FOREIGN KEY([default-aid-type/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$default-aid-type/@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$default-finance-type/@code] FOREIGN KEY([default-finance-type/@code])
REFERENCES [Codelist].[FinanceType] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$default-finance-type/@code]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$default-finance-type/@xml:lang] FOREIGN KEY([default-finance-type/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$default-finance-type/@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$default-flow-type/@code] FOREIGN KEY([default-flow-type/@code])
REFERENCES [Codelist].[FlowType] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$default-flow-type/@code]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$default-flow-type/@xml:lang] FOREIGN KEY([default-flow-type/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$default-flow-type/@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$default-tied-status/@code] FOREIGN KEY([default-tied-status/@code])
REFERENCES [Codelist].[TiedStatus] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$default-tied-status/@code]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$default-tied-status/@xml:lang] FOREIGN KEY([default-tied-status/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$default-tied-status/@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$iati-activitiesID] FOREIGN KEY([iati-activitiesID])
REFERENCES [IATISchema].[iati-activities] ([iati-activitiesID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$iati-activitiesID]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$other-identifier/@owner-ref] FOREIGN KEY([other-identifier/@owner-ref])
REFERENCES [Codelist].[OrganisationIdentifier] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$other-identifier/@owner-ref]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$RegionCode] FOREIGN KEY([RegionCode])
REFERENCES [Codelist].[Region] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$RegionCode]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$reporting-org/@ref] FOREIGN KEY([reporting-org/@ref])
REFERENCES [Codelist].[OrganisationIdentifier] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$reporting-org/@ref]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$reporting-org/@type] FOREIGN KEY([reporting-org/@type])
REFERENCES [Codelist].[OrganisationType] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$reporting-org/@type]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$fk$reporting-org/@xml:lang] FOREIGN KEY([reporting-org/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$fk$reporting-org/@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link$fk$@language] FOREIGN KEY([@language])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity/document-link] NOCHECK CONSTRAINT [iati-activity/document-link$fk$@language]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[iati-activity/document-link] NOCHECK CONSTRAINT [iati-activity/document-link$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/category]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link/category$fk$@code] FOREIGN KEY([@code])
REFERENCES [Codelist].[DocumentCategory] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/category] NOCHECK CONSTRAINT [iati-activity/document-link/category$fk$@code]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/category]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link/category$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/category] NOCHECK CONSTRAINT [iati-activity/document-link/category$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/category]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link/category$fk$document-linkID] FOREIGN KEY([document-linkID])
REFERENCES [IATISchema].[iati-activity/document-link] ([iati-activity/document-linkID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/category] NOCHECK CONSTRAINT [iati-activity/document-link/category$fk$document-linkID]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/language]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link/language$fk$@code] FOREIGN KEY([@code])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/language] NOCHECK CONSTRAINT [iati-activity/document-link/language$fk$@code]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/language]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link/language$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/language] NOCHECK CONSTRAINT [iati-activity/document-link/language$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/language]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link/language$fk$document-linkID] FOREIGN KEY([document-linkID])
REFERENCES [IATISchema].[iati-activity/document-link] ([iati-activity/document-linkID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/language] NOCHECK CONSTRAINT [iati-activity/document-link/language$fk$document-linkID]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/title]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link/title$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/title] NOCHECK CONSTRAINT [iati-activity/document-link/title$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/title]  WITH NOCHECK ADD  CONSTRAINT [iati-activity/document-link/title$fk$document-linkID] FOREIGN KEY([document-linkID])
REFERENCES [IATISchema].[iati-activity/document-link] ([iati-activity/document-linkID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[iati-activity/document-link/title] NOCHECK CONSTRAINT [iati-activity/document-link/title$fk$document-linkID]
GO
ALTER TABLE [IATISchema].[legacy-data]  WITH NOCHECK ADD  CONSTRAINT [legacy-data$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[legacy-data] NOCHECK CONSTRAINT [legacy-data$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[location]  WITH NOCHECK ADD  CONSTRAINT [location104$fk$activity-description/@xml:lang] FOREIGN KEY([activity-description/narrative/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[location] NOCHECK CONSTRAINT [location104$fk$activity-description/@xml:lang]
GO
ALTER TABLE [IATISchema].[location]  WITH NOCHECK ADD  CONSTRAINT [location104$fk$description/@xml:lang] FOREIGN KEY([description/narrative/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[location] NOCHECK CONSTRAINT [location104$fk$description/@xml:lang]
GO
ALTER TABLE [IATISchema].[location]  WITH NOCHECK ADD  CONSTRAINT [location104$fk$exactness/@code] FOREIGN KEY([exactness/@code])
REFERENCES [Codelist].[GeographicLocationReach] ([Code])
GO
ALTER TABLE [IATISchema].[location] NOCHECK CONSTRAINT [location104$fk$exactness/@code]
GO
ALTER TABLE [IATISchema].[location]  WITH NOCHECK ADD  CONSTRAINT [location104$fk$feature-designation/@code] FOREIGN KEY([feature-designation/@code])
REFERENCES [Codelist].[LocationType] ([Code])
GO
ALTER TABLE [IATISchema].[location] NOCHECK CONSTRAINT [location104$fk$feature-designation/@code]
GO
ALTER TABLE [IATISchema].[location]  WITH NOCHECK ADD  CONSTRAINT [location104$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[location] NOCHECK CONSTRAINT [location104$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[location]  WITH NOCHECK ADD  CONSTRAINT [location104$fk$location-class/@code] FOREIGN KEY([location-class/@code])
REFERENCES [Codelist].[GeographicLocationClass] ([Code])
GO
ALTER TABLE [IATISchema].[location] NOCHECK CONSTRAINT [location104$fk$location-class/@code]
GO
ALTER TABLE [IATISchema].[location]  WITH NOCHECK ADD  CONSTRAINT [location104$fk$location-reach/@code] FOREIGN KEY([location-reach/@code])
REFERENCES [Codelist].[GeographicLocationReach] ([Code])
GO
ALTER TABLE [IATISchema].[location] NOCHECK CONSTRAINT [location104$fk$location-reach/@code]
GO
ALTER TABLE [IATISchema].[location]  WITH NOCHECK ADD  CONSTRAINT [location104$fk$name/@xml:lang] FOREIGN KEY([name/narrative/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[location] NOCHECK CONSTRAINT [location104$fk$name/@xml:lang]
GO
ALTER TABLE [IATISchema].[other-identifier]  WITH CHECK ADD  CONSTRAINT [FK_other-identifier_iati-activity] FOREIGN KEY([ActivityId])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[other-identifier] CHECK CONSTRAINT [FK_other-identifier_iati-activity]
GO
ALTER TABLE [IATISchema].[other-identifier]  WITH CHECK ADD  CONSTRAINT [other-identifier$fk@owner-ref] FOREIGN KEY([@owner-ref])
REFERENCES [Codelist].[OrganisationIdentifier] ([Code])
GO
ALTER TABLE [IATISchema].[other-identifier] CHECK CONSTRAINT [other-identifier$fk@owner-ref]
GO
ALTER TABLE [IATISchema].[participating-org]  WITH NOCHECK ADD  CONSTRAINT [participating-org$fk$@role] FOREIGN KEY([@role])
REFERENCES [Codelist].[OrganisationRole] ([Code])
GO
ALTER TABLE [IATISchema].[participating-org] NOCHECK CONSTRAINT [participating-org$fk$@role]
GO
ALTER TABLE [IATISchema].[participating-org]  WITH NOCHECK ADD  CONSTRAINT [participating-org$fk$@type] FOREIGN KEY([@type])
REFERENCES [Codelist].[OrganisationType] ([Code])
GO
ALTER TABLE [IATISchema].[participating-org] NOCHECK CONSTRAINT [participating-org$fk$@type]
GO
ALTER TABLE [IATISchema].[participating-org]  WITH NOCHECK ADD  CONSTRAINT [participating-org$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[participating-org] NOCHECK CONSTRAINT [participating-org$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[participating-org]  WITH NOCHECK ADD  CONSTRAINT [participating-org$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[participating-org] NOCHECK CONSTRAINT [participating-org$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[policy-marker]  WITH NOCHECK ADD  CONSTRAINT [policy-marker$fk$@code] FOREIGN KEY([@code])
REFERENCES [Codelist].[PolicyMarker] ([Code])
GO
ALTER TABLE [IATISchema].[policy-marker] NOCHECK CONSTRAINT [policy-marker$fk$@code]
GO
ALTER TABLE [IATISchema].[policy-marker]  WITH NOCHECK ADD  CONSTRAINT [policy-marker$fk$@significance] FOREIGN KEY([@significance])
REFERENCES [Codelist].[PolicySignificance] ([Code])
GO
ALTER TABLE [IATISchema].[policy-marker] NOCHECK CONSTRAINT [policy-marker$fk$@significance]
GO
ALTER TABLE [IATISchema].[policy-marker]  WITH NOCHECK ADD  CONSTRAINT [policy-marker$fk$@vocabulary] FOREIGN KEY([@vocabulary])
REFERENCES [Codelist].[PolicyMarkerVocabulary] ([Code])
GO
ALTER TABLE [IATISchema].[policy-marker] NOCHECK CONSTRAINT [policy-marker$fk$@vocabulary]
GO
ALTER TABLE [IATISchema].[policy-marker]  WITH NOCHECK ADD  CONSTRAINT [policy-marker$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[policy-marker] NOCHECK CONSTRAINT [policy-marker$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[policy-marker]  WITH NOCHECK ADD  CONSTRAINT [policy-marker$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[policy-marker] NOCHECK CONSTRAINT [policy-marker$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[recipient-country]  WITH NOCHECK ADD  CONSTRAINT [recipient-country$fk$@code] FOREIGN KEY([@code])
REFERENCES [Codelist].[Country] ([Code])
GO
ALTER TABLE [IATISchema].[recipient-country] NOCHECK CONSTRAINT [recipient-country$fk$@code]
GO
ALTER TABLE [IATISchema].[recipient-country]  WITH NOCHECK ADD  CONSTRAINT [recipient-country$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[recipient-country] NOCHECK CONSTRAINT [recipient-country$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[recipient-country]  WITH NOCHECK ADD  CONSTRAINT [recipient-country$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[recipient-country] NOCHECK CONSTRAINT [recipient-country$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[recipient-region]  WITH NOCHECK ADD  CONSTRAINT [recipient-region$fk$@code] FOREIGN KEY([@code])
REFERENCES [Codelist].[Region] ([Code])
GO
ALTER TABLE [IATISchema].[recipient-region] NOCHECK CONSTRAINT [recipient-region$fk$@code]
GO
ALTER TABLE [IATISchema].[recipient-region]  WITH NOCHECK ADD  CONSTRAINT [recipient-region$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[recipient-region] NOCHECK CONSTRAINT [recipient-region$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[recipient-region]  WITH NOCHECK ADD  CONSTRAINT [recipient-region$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[recipient-region] NOCHECK CONSTRAINT [recipient-region$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[related-activity]  WITH NOCHECK ADD  CONSTRAINT [related-activity$fk$@type] FOREIGN KEY([@type])
REFERENCES [Codelist].[RelatedActivityType] ([Code])
GO
ALTER TABLE [IATISchema].[related-activity] NOCHECK CONSTRAINT [related-activity$fk$@type]
GO
ALTER TABLE [IATISchema].[related-activity]  WITH NOCHECK ADD  CONSTRAINT [related-activity$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[related-activity] NOCHECK CONSTRAINT [related-activity$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[related-activity]  WITH NOCHECK ADD  CONSTRAINT [related-activity$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[related-activity] NOCHECK CONSTRAINT [related-activity$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[result/description]  WITH CHECK ADD  CONSTRAINT [FK_result/description_result] FOREIGN KEY([resultId])
REFERENCES [IATISchema].[result] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[result/description] CHECK CONSTRAINT [FK_result/description_result]
GO
ALTER TABLE [IATISchema].[result/indicator]  WITH CHECK ADD  CONSTRAINT [FK_result/indicator_result] FOREIGN KEY([resultId])
REFERENCES [IATISchema].[result] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[result/indicator] CHECK CONSTRAINT [FK_result/indicator_result]
GO
ALTER TABLE [IATISchema].[result/indicator/actual]  WITH CHECK ADD  CONSTRAINT [FK_result/indicator/actual_result/indicator] FOREIGN KEY([result/indicatorId])
REFERENCES [IATISchema].[result/indicator] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[result/indicator/actual] CHECK CONSTRAINT [FK_result/indicator/actual_result/indicator]
GO
ALTER TABLE [IATISchema].[result/title]  WITH CHECK ADD  CONSTRAINT [FK_result/title_result] FOREIGN KEY([resultId])
REFERENCES [IATISchema].[result] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[result/title] CHECK CONSTRAINT [FK_result/title_result]
GO
ALTER TABLE [IATISchema].[sector]  WITH NOCHECK ADD  CONSTRAINT [sector$fk$@code] FOREIGN KEY([@code])
REFERENCES [Codelist].[DAC5DigitSector] ([Code])
GO
ALTER TABLE [IATISchema].[sector] NOCHECK CONSTRAINT [sector$fk$@code]
GO
ALTER TABLE [IATISchema].[sector]  WITH NOCHECK ADD  CONSTRAINT [sector$fk$@vocabulary] FOREIGN KEY([@vocabulary])
REFERENCES [Codelist].[SectorVocabulary] ([Code])
GO
ALTER TABLE [IATISchema].[sector] NOCHECK CONSTRAINT [sector$fk$@vocabulary]
GO
ALTER TABLE [IATISchema].[sector]  WITH NOCHECK ADD  CONSTRAINT [sector$fk$@xml:lang] FOREIGN KEY([@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[sector] NOCHECK CONSTRAINT [sector$fk$@xml:lang]
GO
ALTER TABLE [IATISchema].[sector]  WITH NOCHECK ADD  CONSTRAINT [sector$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[sector] NOCHECK CONSTRAINT [sector$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$aid-type/@code] FOREIGN KEY([aid-type/@code])
REFERENCES [Codelist].[AidType] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$aid-type/@code]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$aid-type/@xml:lang] FOREIGN KEY([aid-type/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$aid-type/@xml:lang]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$description/@xml:lang] FOREIGN KEY([description/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$description/@xml:lang]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$disbursement-channel/@code] FOREIGN KEY([disbursement-channel/@code])
REFERENCES [Codelist].[DisbursementChannel] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$disbursement-channel/@code]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$disbursement-channel/@xml:lang] FOREIGN KEY([disbursement-channel/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$disbursement-channel/@xml:lang]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$finance-type/@code] FOREIGN KEY([finance-type/@code])
REFERENCES [Codelist].[FinanceType] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$finance-type/@code]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$finance-type/@xml:lang] FOREIGN KEY([finance-type/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$finance-type/@xml:lang]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$flow-type/@code] FOREIGN KEY([flow-type/@code])
REFERENCES [Codelist].[FlowType] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$flow-type/@code]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$flow-type/@xml:lang] FOREIGN KEY([flow-type/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$flow-type/@xml:lang]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$iati-activityID] FOREIGN KEY([iati-activityID])
REFERENCES [IATISchema].[iati-activity] ([iati-activityID])
ON DELETE CASCADE
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$iati-activityID]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$provider-org/@ref] FOREIGN KEY([provider-org/@ref])
REFERENCES [Codelist].[OrganisationIdentifier] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$provider-org/@ref]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$provider-org/@xml:lang] FOREIGN KEY([provider-org/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$provider-org/@xml:lang]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$receiver-org/@ref] FOREIGN KEY([receiver-org/@ref])
REFERENCES [Codelist].[OrganisationIdentifier] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$receiver-org/@ref]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$receiver-org/@xml:lang] FOREIGN KEY([receiver-org/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$receiver-org/@xml:lang]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$tied-status/@code] FOREIGN KEY([tied-status/@code])
REFERENCES [Codelist].[TiedStatus] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$tied-status/@code]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$tied-status/@xml:lang] FOREIGN KEY([tied-status/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$tied-status/@xml:lang]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$transaction-type/@code] FOREIGN KEY([transaction-type/@code])
REFERENCES [Codelist].[TransactionType] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$transaction-type/@code]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$transaction-type/@xml:lang] FOREIGN KEY([transaction-type/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$transaction-type/@xml:lang]
GO
ALTER TABLE [IATISchema].[transaction]  WITH NOCHECK ADD  CONSTRAINT [transaction$fk$value/@currency] FOREIGN KEY([value/@currency])
REFERENCES [Codelist].[Currency] ([Code])
GO
ALTER TABLE [IATISchema].[transaction] NOCHECK CONSTRAINT [transaction$fk$value/@currency]
GO
ALTER TABLE [PublicationControl].[LocationData]  WITH NOCHECK ADD  CONSTRAINT [LocationData$fk$administrative/@country] FOREIGN KEY([administrative/@country])
REFERENCES [Codelist].[Country] ([Code])
GO
ALTER TABLE [PublicationControl].[LocationData] NOCHECK CONSTRAINT [LocationData$fk$administrative/@country]
GO
ALTER TABLE [PublicationControl].[LocationData]  WITH NOCHECK ADD  CONSTRAINT [LocationData$fk$coordinates/@precision] FOREIGN KEY([coordinates/@precision])
REFERENCES [Codelist].[GeographicalPrecision] ([Code])
GO
ALTER TABLE [PublicationControl].[LocationData] NOCHECK CONSTRAINT [LocationData$fk$coordinates/@precision]
GO
ALTER TABLE [PublicationControl].[LocationData]  WITH NOCHECK ADD  CONSTRAINT [LocationData$fk$description/@xml:lang] FOREIGN KEY([description/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [PublicationControl].[LocationData] NOCHECK CONSTRAINT [LocationData$fk$description/@xml:lang]
GO
ALTER TABLE [PublicationControl].[LocationData]  WITH NOCHECK ADD  CONSTRAINT [LocationData$fk$gazetteer-entry/@gazetteer-ref] FOREIGN KEY([gazetteer-entry/@gazetteer-ref])
REFERENCES [Codelist].[GazetteerAgency] ([Code])
GO
ALTER TABLE [PublicationControl].[LocationData] NOCHECK CONSTRAINT [LocationData$fk$gazetteer-entry/@gazetteer-ref]
GO
ALTER TABLE [PublicationControl].[LocationData]  WITH NOCHECK ADD  CONSTRAINT [LocationData$fk$location-type/@code] FOREIGN KEY([location-type/@code])
REFERENCES [Codelist].[LocationType] ([Code])
GO
ALTER TABLE [PublicationControl].[LocationData] NOCHECK CONSTRAINT [LocationData$fk$location-type/@code]
GO
ALTER TABLE [PublicationControl].[LocationData]  WITH NOCHECK ADD  CONSTRAINT [LocationData$fk$location-type/@xml:lang] FOREIGN KEY([location-type/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [PublicationControl].[LocationData] NOCHECK CONSTRAINT [LocationData$fk$location-type/@xml:lang]
GO
ALTER TABLE [PublicationControl].[LocationData]  WITH NOCHECK ADD  CONSTRAINT [LocationData$fk$name/@xml:lang] FOREIGN KEY([name/@xml:lang])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [PublicationControl].[LocationData] NOCHECK CONSTRAINT [LocationData$fk$name/@xml:lang]
GO
ALTER TABLE [PublicationControl].[MappingBenefittingCountry]  WITH NOCHECK ADD  CONSTRAINT [MappingBenefittingCountry$fk$BenefittingCountryTypeCode] FOREIGN KEY([BenefittingCountryTypeCode])
REFERENCES [PublicationControl].[MappingBenefittingCountryType] ([Code])
GO
ALTER TABLE [PublicationControl].[MappingBenefittingCountry] NOCHECK CONSTRAINT [MappingBenefittingCountry$fk$BenefittingCountryTypeCode]
GO
ALTER TABLE [PublicationControl].[MappingBenefittingCountry]  WITH NOCHECK ADD  CONSTRAINT [MappingBenefittingCountry$fk$IATICountryCode] FOREIGN KEY([IATICountryCode])
REFERENCES [Codelist].[Country] ([Code])
GO
ALTER TABLE [PublicationControl].[MappingBenefittingCountry] NOCHECK CONSTRAINT [MappingBenefittingCountry$fk$IATICountryCode]
GO
ALTER TABLE [PublicationControl].[MappingBenefittingCountry]  WITH NOCHECK ADD  CONSTRAINT [MappingBenefittingCountry$fk$IATIRegionCode] FOREIGN KEY([IATIRegionCode])
REFERENCES [Codelist].[Region] ([Code])
GO
ALTER TABLE [PublicationControl].[MappingBenefittingCountry] NOCHECK CONSTRAINT [MappingBenefittingCountry$fk$IATIRegionCode]
GO
ALTER TABLE [PublicationControl].[MappingQuestContentType]  WITH NOCHECK ADD  CONSTRAINT [MappingQuestContentType$fk$IATIContentTypeCode] FOREIGN KEY([IATIContentTypeCode])
REFERENCES [Codelist].[DocumentCategory] ([Code])
GO
ALTER TABLE [PublicationControl].[MappingQuestContentType] NOCHECK CONSTRAINT [MappingQuestContentType$fk$IATIContentTypeCode]
GO
ALTER TABLE [PublicationControl].[MappingQuestLanguage]  WITH NOCHECK ADD  CONSTRAINT [MappingQuestLanguage$fk$IATILanguageCode] FOREIGN KEY([IATILanguageCode])
REFERENCES [Codelist].[Language] ([Code])
GO
ALTER TABLE [PublicationControl].[MappingQuestLanguage] NOCHECK CONSTRAINT [MappingQuestLanguage$fk$IATILanguageCode]
GO
ALTER TABLE [PublicationControl].[PopulationComponent]  WITH NOCHECK ADD  CONSTRAINT [PopulationComponent$fk$PopulationId] FOREIGN KEY([PopulationId])
REFERENCES [PublicationControl].[Population] ([PopulationId])
ON DELETE CASCADE
GO
ALTER TABLE [PublicationControl].[PopulationComponent] NOCHECK CONSTRAINT [PopulationComponent$fk$PopulationId]
GO
ALTER TABLE [IATISchema].[budget]  WITH NOCHECK ADD  CONSTRAINT [budget$ck$value] CHECK  (([value/text()] IS NOT NULL AND [value/@value-date] IS NOT NULL OR [value/@value-date] IS NULL AND [value/@currency] IS NULL AND [value/text()] IS NULL))
GO
ALTER TABLE [IATISchema].[budget] NOCHECK CONSTRAINT [budget$ck$value]
GO
ALTER TABLE [IATISchema].[iati-activity]  WITH NOCHECK ADD  CONSTRAINT [iati-activity$ck$@hierarchy] CHECK  (([@hierarchy]='2' OR [@hierarchy]='1'))
GO
ALTER TABLE [IATISchema].[iati-activity] NOCHECK CONSTRAINT [iati-activity$ck$@hierarchy]
GO
ALTER TABLE [PublicationControl].[ComponentsOnStaging]  WITH NOCHECK ADD  CONSTRAINT [CK_ComponentsOnStaging_Status] CHECK  (([Status]='NotYetReleased' OR [Status]='ToBeWithdrawn' OR [Status]='AwaitingPublication' OR [Status]='Published' OR [Status]='Withdrawn' OR [Status]='DoNotPublish'))
GO
ALTER TABLE [PublicationControl].[ComponentsOnStaging] NOCHECK CONSTRAINT [CK_ComponentsOnStaging_Status]
GO
ALTER TABLE [PublicationControl].[ComponentsOnStaging]  WITH NOCHECK ADD  CONSTRAINT [CK_ComponentsOnStaging_StatusFinData] CHECK  (([StatusFinData]='InActiveProcurement' OR [StatusFinData]='HideFinData' OR [StatusFinData]='HideBudgetOnly' OR [StatusFinData]='Release'))
GO
ALTER TABLE [PublicationControl].[ComponentsOnStaging] NOCHECK CONSTRAINT [CK_ComponentsOnStaging_StatusFinData]
GO
ALTER TABLE [PublicationControl].[MappingAccount]  WITH NOCHECK ADD  CONSTRAINT [MappingAccount$ck$IncludeExclue] CHECK  (([IncludeExclude]='exclude' OR [IncludeExclude]='include'))
GO
ALTER TABLE [PublicationControl].[MappingAccount] NOCHECK CONSTRAINT [MappingAccount$ck$IncludeExclue]
GO
ALTER TABLE [PublicationControl].[MappingBenefittingCountry]  WITH NOCHECK ADD  CONSTRAINT [MappingBenefittingCountry$ck$Geography] CHECK  (([BenefittingCountryTypeCode]=(1) AND [IATICountryCode] IS NOT NULL AND [IATIRegionCode] IS NULL OR [BenefittingCountryTypeCode]=(2) AND [IATICountryCode] IS NULL AND [IATIRegionCode] IS NULL OR [BenefittingCountryTypeCode]=(3) AND [IATICountryCode] IS NULL AND [IATIRegionCode] IS NOT NULL OR [BenefittingCountryTypeCode]=(4) AND [IATICountryCode] IS NULL AND [IATIRegionCode] IS NULL OR [BenefittingCountryTypeCode]=(5) AND [IATICountryCode] IS NULL AND [IATIRegionCode] IS NULL))
GO
ALTER TABLE [PublicationControl].[MappingBenefittingCountry] NOCHECK CONSTRAINT [MappingBenefittingCountry$ck$Geography]
GO
ALTER TABLE [PublicationControl].[Population]  WITH NOCHECK ADD  CONSTRAINT [Population$ck$ExportedFlag] CHECK  ((CONVERT([varbinary](1),[ExportedFlag],(0))=0x4E OR CONVERT([varbinary](1),[ExportedFlag],(0))=0x59))
GO
ALTER TABLE [PublicationControl].[Population] NOCHECK CONSTRAINT [Population$ck$ExportedFlag]
GO
ALTER TABLE [PublicationControl].[PopulationComponent]  WITH NOCHECK ADD  CONSTRAINT [PopulationComponent$ck$StatusFinData] CHECK  (([StatusFinData]=N'HideBudgetOnly' OR [StatusFinData]=N'HideFinData' OR [StatusFinData]=N'Release'))
GO
ALTER TABLE [PublicationControl].[PopulationComponent] NOCHECK CONSTRAINT [PopulationComponent$ck$StatusFinData]
GO
ALTER TABLE [PublicationControl].[ProjectsOnStaging]  WITH NOCHECK ADD  CONSTRAINT [CK_ProjectsOnStaging_DoNotPublish] CHECK  (([DoNotPublish]='y' OR [DoNotPublish]='n'))
GO
ALTER TABLE [PublicationControl].[ProjectsOnStaging] NOCHECK CONSTRAINT [CK_ProjectsOnStaging_DoNotPublish]
GO
ALTER TABLE [PublicationControl].[ProjectsOnStaging]  WITH NOCHECK ADD  CONSTRAINT [CK_ProjectsOnStaging_StatusFinData] CHECK  (([StatusFinData]='Release' OR [StatusFinData]='HideFinData' OR [StatusFinData]='HideBudgetOnly'))
GO
ALTER TABLE [PublicationControl].[ProjectsOnStaging] NOCHECK CONSTRAINT [CK_ProjectsOnStaging_StatusFinData]
GO
/****** Object:  StoredProcedure [Configuration].[p_ErrorHandler]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE PROCEDURE [Configuration].[p_ErrorHandler]
AS
BEGIN
	DECLARE @OriginalText NVARCHAR(36)
	SET @OriginalText = 'Original Error Details:'

	DECLARE @ErrorNumber INT, @ErrorMessage NVARCHAR(4000), @ErrorSeverity INT, @ErrorState INT, @ErrorProcedure NVARCHAR(126), @ErrorLine INT
	SELECT @ErrorNumber = ERROR_NUMBER(), @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE(), @ErrorProcedure = ERROR_PROCEDURE(), @ErrorLine = ERROR_LINE()

	IF @ErrorMessage NOT LIKE '%' + @OriginalText + '%'
	BEGIN
		SET @ErrorMessage =
			@ErrorMessage
			+ ' - ' + @OriginalText
			+ ', Number: %li'
			+ ', Procedure: %s'
			+ ', LineNumber: %li'

		IF @@TRANCOUNT = 0
			INSERT INTO Configuration.Error (Number, Message, Severity, State, [Procedure], Line) VALUES (@ErrorNumber, @ErrorMessage, @ErrorSeverity, @ErrorState, @ErrorProcedure, @ErrorLine)
	END

	RAISERROR(@ErrorMessage, @ErrorSeverity, @ErrorState, @ErrorNumber, @ErrorProcedure, @ErrorLine) WITH NOWAIT
END



GO
/****** Object:  StoredProcedure [IATISchema].[GetActivitiesXml]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO















-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [IATISchema].[GetActivitiesXml]
(
		@RecipientCountry		VARCHAR(10) = NULL,
		@Region					VARCHAR(10) = NULL,
		@Sector					VARCHAR(10) = NULL,
		@ProjectId				VARCHAR(25) = NULL
)
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;


IF @RecipientCountry IS NOT NULL 
	BEGIN
		SELECT TypedXML FROM IATISchema.f_activitiesXMLFile_201(1,NULL,NULL,NULL,NULL, @RecipientCountry,NULL,NULL)
	END

IF @ProjectId IS NOT NULL 
	BEGIN
		SELECT TypedXML FROM IATISchema.f_activitiesXMLFile_201(1,@ProjectId,NULL,NULL,NULL,NULL,NULL,NULL)
	END

END
























GO
/****** Object:  StoredProcedure [PublicationControl].[p_GenerateMonthlyComponentsOnStaging]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PublicationControl].[p_GenerateMonthlyComponentsOnStaging] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--perhaps can't be transactional to perform all steps below....
	BEGIN TRY BEGIN TRANSACTION;
	
		--[1] INSERT new components into ComponentsOnStaging (Status to default to 'AwaitingPublication' and StatusFinData defaults to 'Release')
		INSERT INTO [PublicationControl].[ComponentsOnStaging] (ProjectCode, ComponentCode)
            SELECT DISTINCT comp.ProjectId, comp.ComponentId FROM [IATI].[PublicationControl].[v_Component] comp
            LEFT JOIN [IATI].[PublicationControl].[v_Project] proj 
				ON comp.ProjectId = proj.ProjectId
            LEFT JOIN [IATI].[PublicationControl].[v_Financial] fin 
				ON comp.ComponentId = fin.ComponentId
            WHERE 
				comp.ComponentId NOT IN (SELECT DISTINCT ComponentCode FROM [PublicationControl].[ComponentsOnStaging])
				AND comp.ComponentId NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Component' AND Status='Open')
				AND comp.ProjectId IS NOT NULL AND proj.StageCode > 2 
                AND (comp.FundingTypeCode IS NOT NULL AND comp.FundingTypeCode <> '' 
                AND comp.FundingTypeCode NOT IN ('ADMINRESOURCE','ADMINCAPITAL','OTHER','RAR')) 
                AND DATEDIFF(D, '2009-08-13', proj.OperationalEndDate) > 0 AND (Year(proj.OperationalEndDate) < 2099 OR proj.StageCode < 6) 
                AND comp.ProjectId NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND Status='Open') 
            GROUP BY comp.ProjectId, comp.ComponentId, InActiveProcurement 
            HAVING SUM(fin.BudIndicative + fin.BudNonIndicative) >= 500
        
        --[2] UPDATE ComponentsOnStaging to reset any withdrawn components that should now to published (reset Status to 'AwaitingPublication')
        UPDATE [PublicationControl].[ComponentsOnStaging] SET Status = 'AwaitingPublication'
			WHERE Status IN ('Withdrawn', 'NotYetReleased') AND ComponentCode IN
            (SELECT DISTINCT comp.ComponentId FROM [IATI].[PublicationControl].[v_Component] comp
				LEFT JOIN [IATI].[PublicationControl].[v_Project] proj 
					ON comp.ProjectId = proj.ProjectId
				LEFT JOIN [IATI].[PublicationControl].[v_Financial] fin 
					ON comp.ComponentId = fin.ComponentId 
					WHERE 
						comp.ProjectId IS NOT NULL AND proj.StageCode > 2 
						AND (comp.FundingTypeCode IS NOT NULL AND comp.FundingTypeCode <> '' 
						AND comp.FundingTypeCode NOT IN ('ADMINRESOURCE','ADMINCAPITAL','OTHER','RAR')) 
						AND DATEDIFF(D, '2009-08-13', proj.OperationalEndDate) > 0 AND (Year(proj.OperationalEndDate) < 2099 OR proj.StageCode < 6) 
						AND comp.ProjectId NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND Status='Open')
						AND comp.ComponentId NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Component' AND Status='Open') 
					GROUP BY comp.ProjectId, comp.ComponentId, InActiveProcurement 
					HAVING SUM(fin.BudIndicative + fin.BudNonIndicative) >= 500)
        
        --[3] UPDATE ComponentsOnStaging to reset any 'ToBeWithdrawn' components that should now to published (reset Status to 'Published') 
        --this step introduced because export for previous month's cycle may not happen before new monthly cycle begins
        UPDATE [PublicationControl].[ComponentsOnStaging] SET Status = 'Published'
			WHERE Status IN ('ToBeWithdrawn') AND ComponentCode IN
            (SELECT DISTINCT comp.ComponentId FROM [IATI].[PublicationControl].[v_Component] comp
				LEFT JOIN [IATI].[PublicationControl].[v_Project] proj 
					ON comp.ProjectId = proj.ProjectId
				LEFT JOIN [IATI].[PublicationControl].[v_Financial] fin 
					ON comp.ComponentId = fin.ComponentId 
					WHERE
						comp.ProjectId IS NOT NULL AND proj.StageCode > 2 
						AND (comp.FundingTypeCode IS NOT NULL AND comp.FundingTypeCode <> '' 
						AND comp.FundingTypeCode NOT IN ('ADMINRESOURCE','ADMINCAPITAL','OTHER','RAR')) 
						AND DATEDIFF(D, '2009-08-13', proj.OperationalEndDate) > 0 AND (Year(proj.OperationalEndDate) < 2099 OR proj.StageCode < 6) 
						AND comp.ProjectId NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND Status='Open')
						AND comp.ComponentId NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Component' AND Status='Open') 
					GROUP BY comp.ProjectId, comp.ComponentId, InActiveProcurement 
					HAVING SUM(fin.BudIndicative + fin.BudNonIndicative) >= 500)
		
		--[4] UPDATE ComponentsOnStaging to capture all 'Published' or 'AwaitingPublication' projects to be set to 'ToBeWithdrawn' 
        --no longer meeting criteria or set to be withdrawn in ProjectsOnStaging
        UPDATE [PublicationControl].[ComponentsOnStaging] SET Status = 'ToBeWithdrawn'
			WHERE Status IN ('Published', 'AwaitingPublication') AND ComponentCode NOT IN
            (SELECT DISTINCT comp.ComponentId FROM [IATI].[PublicationControl].[v_Component] comp
				LEFT JOIN [IATI].[PublicationControl].[v_Project] proj 
					ON comp.ProjectId = proj.ProjectId
				LEFT JOIN [IATI].[PublicationControl].[v_Financial] fin 
					ON comp.ComponentId = fin.ComponentId 
					WHERE
						comp.ProjectId IS NOT NULL AND proj.StageCode > 2 
						AND (comp.FundingTypeCode IS NOT NULL AND comp.FundingTypeCode <> '' 
						AND comp.FundingTypeCode NOT IN ('ADMINRESOURCE','ADMINCAPITAL','OTHER','RAR')) 
						AND DATEDIFF(D, '2009-08-13', proj.OperationalEndDate) > 0 AND (Year(proj.OperationalEndDate) < 2099 OR proj.StageCode < 6) 
						AND comp.ProjectId NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND Status='Open')
						AND comp.ComponentId NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Component' AND Status='Open') 
					GROUP BY comp.ProjectId, comp.ComponentId, InActiveProcurement 
					HAVING SUM(fin.BudIndicative + fin.BudNonIndicative) >= 500)
		
		--Update PublishedDocuments to capture all 'unpublished' documents to be set to 'Published'
		UPDATE [PublicationControl].[PublishedDocuments] SET PublicationStatusID=1
			WHERE PublicationStatusID=2		 
                    
	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
           DECLARE @ErrorMessage NVARCHAR(4000); DECLARE @ErrorSeverity INT; DECLARE @ErrorState INT;
           SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
           RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH                
    
END



GO
/****** Object:  StoredProcedure [PublicationControl].[p_GetDocumentMetadataForMultipleRecords]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PublicationControl].[p_GetDocumentMetadataForMultipleRecords] 
	-- Add the parameters for the stored procedure here
	@stageCode INT,
	@documentDate DATE,
	@content_type VARCHAR(80),
	@declared BIT,
	@PDFAllowed BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--declare @maxPopulationID int
	--set @maxPopulationID = (Select MAX(PopulationId) From [IATI].PopulationDocument)
    -- Insert statements for procedure here
    DECLARE @extension TABLE (ExtensionType VARCHAR (10))
    
    IF @PDFAllowed=1
		INSERT INTO @extension(ExtensionType)
		SELECT 'pdf' UNION ALL SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'
	ELSE
		INSERT INTO @extension(ExtensionType)
		SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'	
    
    Select proj.ProjectID, doc.DocumentID, ver.VersionNo
				From [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentCurrent doc 
					inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentProjectCurrent proj 
					on doc.DocumentID = proj.DocumentID 
					inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentTypeCurrent doctype 
					on doc.DocumentID = doctype.DocumentID 
					inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentVersionCurrent ver
					on doc.DocumentID = ver.DocumentID
					inner join [ProjectDataMart].[EDRMSourceData].[v_ProjectDocumentPageCurrent] page
					on doc.DocumentID = page.DocumentID
					left outer join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentLinkCurrent link
					on doc.DocumentID = link.DocumentID
					inner join [ProjectDataMart].[AgressoTransformation].[v_ProjectTransformedCurrent] proj_trans 
					on proj.ProjectID = proj_trans.ProjectId 
					inner join (Select * From [IATI].[IATISchema].[iati-activity] where ComponentId is NULL) As iati_project
					on proj.ProjectID = iati_project.ProjectId 
				Where proj_trans.StageCode >= @stageCode 
					and doc.CreatedDate >= @documentDate 
					and doctype.Content_Type = @content_type 
					and doc.Declared = @declared 
					and (link.LinkChainType != 'superseded' or link.LinkChainType is null) and lower(reverse(left(reverse([OriginalFileName]),Abs(charindex('.',reverse([OriginalFileName]))-1)))) IN (select ExtensionType from @extension)
					and NOT EXISTS (SELECT 1 
									FROM ( SELECT ID 
											FROM [PublicationControl].[ExclusionDetails] 
											WHERE ExclusionType='Document' AND Status='Open' 
											GROUP BY ID) As Blacklisted_Documents
									WHERE doc.DocumentID = Blacklisted_Documents.ID)
				 Group by proj.ProjectID, doc.DocumentID, ver.VersionNo		 					
END




GO
/****** Object:  StoredProcedure [PublicationControl].[p_GetDocumentMetadataForSingularNotRecord]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PublicationControl].[p_GetDocumentMetadataForSingularNotRecord] 
	-- Add the parameters for the stored procedure here
	@stageCode INT,
	@documentDate DATE,
	@content_type VARCHAR(80),
	@PDFAllowed BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--declare @maxPopulationID int
	--set @maxPopulationID = (Select MAX(PopulationId) From [IATI].PopulationDocument)
    -- Insert statements for procedure here
    DECLARE @extension TABLE (ExtensionType VARCHAR (10))
    
    IF @PDFAllowed=1
		INSERT INTO @extension(ExtensionType)
		SELECT 'pdf' UNION ALL SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'
	ELSE
		INSERT INTO @extension(ExtensionType)
		SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'	
		
    select ProjectID, DocumentID, VersionNo, DocumentRank
				from   (select 
							doc.*, proj.ProjectID, doctype.Content_Type, proj_trans.StageCode,
							ver.FileSize, ver.VersionNo, link.LinkChainType, link.LinkDocument,
							link.LinkRelationship,
							RANK() OVER 
							(PARTITION BY proj.ProjectID ORDER BY ver.DocumentId DESC) AS DocumentRank
							from [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentCurrent doc 
							inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentProjectCurrent proj 
							on doc.DocumentID = proj.DocumentID 
							inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentTypeCurrent doctype 
							on doc.DocumentID = doctype.DocumentID 
							inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentVersionCurrent ver
							on doc.DocumentID = ver.DocumentID
							inner join [ProjectDataMart].[EDRMSourceData].[v_ProjectDocumentPageCurrent] page
							on doc.DocumentID = page.DocumentID
							left outer join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentLinkCurrent link
							on doc.DocumentID = link.DocumentID
							inner join [ProjectDataMart].[AgressoTransformation].[v_ProjectTransformedCurrent] proj_trans 
							on proj.ProjectID = proj_trans.ProjectId 
							inner join (Select * From [IATI].[IATISchema].[iati-activity] where ComponentId is NULL) As iati_project
							on proj.ProjectID = iati_project.ProjectId 
							where proj_trans.StageCode >= @stageCode 
							and doc.CreatedDate >= @documentDate 
							and doctype.Content_Type = @content_type 
							and (link.LinkChainType != 'superseded' or link.LinkChainType is null) and lower(reverse(left(reverse([OriginalFileName]),Abs(charindex('.',reverse([OriginalFileName]))-1)))) IN (select ExtensionType from @extension)
							and NOT EXISTS (SELECT 1 
											FROM ( SELECT ID 
													FROM [PublicationControl].[ExclusionDetails] 
													WHERE ExclusionType='Document' AND Status='Open' 
													GROUP BY ID) As Blacklisted_Documents
											WHERE doc.DocumentID = Blacklisted_Documents.ID)) as ValidDocuments
				Where DocumentRank = 1
				Group by ProjectID, DocumentID, DocumentRank, VersionNo	        
END



GO
/****** Object:  StoredProcedure [PublicationControl].[p_GetDocumentMetadataForSingularRecords]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PublicationControl].[p_GetDocumentMetadataForSingularRecords] 
	-- Add the parameters for the stored procedure here
	@stageCode INT,
	@documentDate DATE,
	@content_type VARCHAR(80),
	@declared BIT,
	@PDFAllowed BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--declare @maxPopulationID int
	--set @maxPopulationID = (Select MAX(PopulationId) From [IATI].PopulationDocument)
    -- Insert statements for procedure here
    DECLARE @extension TABLE (ExtensionType VARCHAR (10))
    
    IF @PDFAllowed=1
		INSERT INTO @extension(ExtensionType)
		SELECT 'pdf' UNION ALL SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'
	ELSE
		INSERT INTO @extension(ExtensionType)
		SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'	
		
    Select ProjectID, DocumentID, VersionNo, DocumentRank
				From   (select 
						doc.*, proj.ProjectID, doctype.Content_Type, proj_trans.StageCode,
						ver.FileSize, ver.VersionNo, link.LinkChainType, link.LinkDocument,
						link.LinkRelationship,
						RANK() OVER 
						(PARTITION BY proj.ProjectID ORDER BY ver.DocumentId DESC) AS DocumentRank
						from [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentCurrent doc 
						inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentProjectCurrent proj 
						on doc.DocumentID = proj.DocumentID 
						inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentTypeCurrent doctype 
						on doc.DocumentID = doctype.DocumentID 
						inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentVersionCurrent ver
						on doc.DocumentID = ver.DocumentID
						inner join [ProjectDataMart].[EDRMSourceData].[v_ProjectDocumentPageCurrent] page
						on doc.DocumentID = page.DocumentID
						left outer join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentLinkCurrent link
						on doc.DocumentID = link.DocumentID
						inner join [ProjectDataMart].[AgressoTransformation].[v_ProjectTransformedCurrent] proj_trans 
						on proj.ProjectID = proj_trans.ProjectId 
						inner join (Select * From [IATI].[IATISchema].[iati-activity] where ComponentId is NULL) As iati_project
						on proj.ProjectID = iati_project.ProjectId 
						where proj_trans.StageCode >= @stageCode 
						and doc.CreatedDate >= @documentDate 
						and doctype.Content_Type = @content_type 
						and doc.Declared = @declared 
						and (link.LinkChainType != 'superseded' or link.LinkChainType is null) and lower(reverse(left(reverse([OriginalFileName]),Abs(charindex('.',reverse([OriginalFileName]))-1)))) IN (select ExtensionType from @extension)
						and NOT EXISTS (SELECT 1 
										FROM ( SELECT ID 
												FROM [PublicationControl].[ExclusionDetails] 
												WHERE ExclusionType='Document' AND Status='Open' 
												GROUP BY ID) As Blacklisted_Documents
										WHERE doc.DocumentID = Blacklisted_Documents.ID)) as ValidDocuments
				Where DocumentRank = 1
				Group by ProjectID, DocumentID, DocumentRank, VersionNo				
END




GO
/****** Object:  StoredProcedure [PublicationControl].[p_GetDocumentMetadataForSingularRecordsProjectCutOff]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO





-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PublicationControl].[p_GetDocumentMetadataForSingularRecordsProjectCutOff] 
	-- Add the parameters for the stored procedure here
	@stageCode INT,
	@documentDate DATE,
	@content_type VARCHAR(80),
	@declared BIT,
	@projectCutOffDate DATE,
	@PDFAllowed BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--declare @maxPopulationID int
	--set @maxPopulationID = (Select MAX(PopulationId) From [IATI].PopulationDocument)
    -- Insert statements for procedure here
    
    DECLARE @extension TABLE (ExtensionType VARCHAR (10))
    
    IF @PDFAllowed=1
		INSERT INTO @extension(ExtensionType)
		SELECT 'pdf' UNION ALL SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'
	ELSE
		INSERT INTO @extension(ExtensionType)
		SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'	
		
    Select ProjectID, DocumentID, VersionNo, DocumentRank
				From   (select 
							doc.*, proj.ProjectID, doctype.Content_Type, proj_trans.StageCode,
							ver.FileSize, ver.VersionNo, link.LinkChainType, link.LinkDocument,
							link.LinkRelationship,
							RANK() OVER 
							(PARTITION BY proj.ProjectID ORDER BY ver.DocumentId DESC) AS DocumentRank
						from [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentCurrent doc 
							inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentProjectCurrent proj 
							on doc.DocumentID = proj.DocumentID 
							inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentTypeCurrent doctype 
							on doc.DocumentID = doctype.DocumentID 
							inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentVersionCurrent ver
							on doc.DocumentID = ver.DocumentID
							inner join [ProjectDataMart].[EDRMSourceData].[v_ProjectDocumentPageCurrent] page
							on doc.DocumentID = page.DocumentID
							left outer join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentLinkCurrent link
							on doc.DocumentID = link.DocumentID
							inner join [ProjectDataMart].[AgressoTransformation].[v_ProjectTransformedCurrent]  proj_trans 
							on proj.ProjectID = proj_trans.ProjectId
							inner join (Select * From [IATI].[IATISchema].[iati-activity] where ComponentId is NULL) As iati_project
							on proj.ProjectID = iati_project.ProjectId               
						where proj_trans.StageCode >= @stageCode 
							and doc.CreatedDate >= @documentDate 
							and doctype.Content_Type = @content_type 
							and doc.Declared = @declared 
							and proj_trans.ApprovalDate >= @projectCutOffDate
							and (link.LinkChainType != 'superseded' or link.LinkChainType is null) and lower(reverse(left(reverse([OriginalFileName]),Abs(charindex('.',reverse([OriginalFileName]))-1)))) IN (select ExtensionType from @extension)
							and NOT EXISTS (SELECT 1 
											FROM ( SELECT ID 
													FROM [PublicationControl].[ExclusionDetails] 
													WHERE ExclusionType='Document' AND Status='Open' 
													GROUP BY ID) As Blacklisted_Documents
											WHERE doc.DocumentID = Blacklisted_Documents.ID)) as ValidDocuments
				Where DocumentRank = 1
				Group by ProjectID, DocumentID, DocumentRank, VersionNo		
END





GO
/****** Object:  StoredProcedure [PublicationControl].[p_GetDocumentMetadataForSingularRecordWithLanguage]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PublicationControl].[p_GetDocumentMetadataForSingularRecordWithLanguage]
	-- Add the parameters for the stored procedure here
	@stageCode INT,
	@documentDate DATE,
	@content_type VARCHAR(80),
	@declared BIT,
	@PDFAllowed BIT
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--declare @maxPopulationID int
	--set @maxPopulationID = (Select MAX(PopulationId) From [IATI].PopulationDocument)
    -- Insert statements for procedure here
    DECLARE @extension TABLE (ExtensionType VARCHAR (10))
    
    IF @PDFAllowed=1
		INSERT INTO @extension(ExtensionType)
		SELECT 'pdf' UNION ALL SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'
	ELSE
		INSERT INTO @extension(ExtensionType)
		SELECT 'doc' UNION ALL SELECT 'docx' UNION ALL SELECT 'xls' UNION ALL SELECT 'xlsx'	
    
    Select ProjectID, DocumentID, VersionNo, DocumentRank
				From   (select 
						doc.*, proj.ProjectID, doctype.Content_Type, proj_trans.StageCode,
						ver.FileSize, ver.VersionNo, link.LinkChainType, link.LinkDocument,
						link.LinkRelationship,
						RANK() OVER 
						(PARTITION BY proj.ProjectID,doctype.[Language] ORDER BY ver.DocumentId DESC) AS DocumentRank
						from [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentCurrent doc 
						inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentProjectCurrent proj 
						on doc.DocumentID = proj.DocumentID 
						inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentTypeCurrent doctype 
						on doc.DocumentID = doctype.DocumentID 
						inner join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentVersionCurrent ver
						on doc.DocumentID = ver.DocumentID
						inner join [ProjectDataMart].[EDRMSourceData].[v_ProjectDocumentPageCurrent] page
						on doc.DocumentID = page.DocumentID
						left outer join [ProjectDataMart].[EDRMSourceData].v_ProjectDocumentLinkCurrent link
						on doc.DocumentID = link.DocumentID
						inner join [ProjectDataMart].[AgressoTransformation].[v_ProjectTransformedCurrent] proj_trans 
						on proj.ProjectID = proj_trans.ProjectId 
						inner join (Select * From [IATI].[IATISchema].[iati-activity] where ComponentId is NULL) As iati_project
						on proj.ProjectID = iati_project.ProjectId 
						where proj_trans.StageCode >= @stageCode 
						and doc.CreatedDate >= @documentDate 
						and doctype.Content_Type = @content_type 
						and doc.Declared = @declared 
						and doctype.[Language] is not null
						and (link.LinkChainType != 'superseded' or link.LinkChainType is null) and lower(reverse(left(reverse([OriginalFileName]),Abs(charindex('.',reverse([OriginalFileName]))-1)))) IN (select ExtensionType from @extension)
						and NOT EXISTS (SELECT 1 
								FROM ( SELECT ID 
										FROM [PublicationControl].[ExclusionDetails] 
										WHERE ExclusionType='Document' AND Status='Open' 
										GROUP BY ID) As Blacklisted_Documents
								WHERE doc.DocumentID = Blacklisted_Documents.ID)) as ValidDocuments
				Where DocumentRank = 1
				Group by ProjectID, DocumentID, DocumentRank, VersionNo
END




GO
/****** Object:  StoredProcedure [PublicationControl].[p_Populate]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO









--DROP PROCEDURE [IATI].[p_Populate]


CREATE PROCEDURE [PublicationControl].[p_Populate]
(
	@ExportedFlag				Configuration.Flag		= 'N',
	@VersionId					Configuration.Version	= NULL,
	@PivotDays					INT						= 5,
	@LatestTransactionDate		DATETIME				= NULL
)
AS
--*/
	-- Uncomment these declarations if you want to run this routine as a script and not a procedure
	DECLARE @ExportedFlagInternal			Configuration.Flag
	DECLARE @VersionIdInternal				Configuration.Version
	DECLARE @PivotDaysInternal				INT
	DECLARE	@LatestTransactionDateInternal	DATETIME
	
	SET @ExportedFlagInternal			= @ExportedFlag
	SET @VersionIdInternal				= @VersionId
	SET @PivotDaysInternal				= @PivotDays
	SET @LatestTransactionDateInternal	= @LatestTransactionDate
	
	DECLARE	@ActivitiesId					INT					
	DECLARE	@DFIDOrganisationIdentifier		NVARCHAR(255)	
	DECLARE	@DFIDOrganisationName			NVARCHAR(4)	
	DECLARE	@EarliestTransactionDate		DATETIME			
	DECLARE	@MinimumTransactionAmount		INT					
	DECLARE	@ComponentSource				SYSNAME				
	DECLARE	@DocumentSource					SYSNAME				
	DECLARE @DocumentURIPrefix				NVARCHAR(MAX)

	SET @ActivitiesId						= 101
	SET @DFIDOrganisationIdentifier			= N'GB-1'
	SET @DFIDOrganisationName				= N'DFID'
	SET @EarliestTransactionDate			= '20100512'
	SET @MinimumTransactionAmount			= 500
	SET @ComponentSource					= NULL
	SET @DocumentSource						= NULL
	SET @DocumentURIPrefix					= N'http://iati.dfid.gov.uk/iati_documents/'
	SET @ExportedFlagInternal = ISNULL(@ExportedFlagInternal, 'N')
	/* this allows the script to run without being part of the stored procedure if necessary, 
	* also the routine will not work if a NULL value is passed in the @PivotDaysInternal parameter*/
	SET @PivotDaysInternal = ISNULL(@PivotDaysInternal, 5) 

	/* If no explicit latest transaction date is specified then we use the end of the previous month, provided we 
	 * are at least @PivotDaysInternal + 1 days into the current month, otherwise we use the end of the month before that.
	 * With the default value of 5 days for @PivotDaysInternal then if it is on or after the 6th of the month we will use 
	 * the end of the previous month, otherwise we will use the end of the month two months prior to the current month.*/
	IF @LatestTransactionDateInternal IS NULL
	BEGIN
		DECLARE @PivotDateTime DATETIME
		SET @PivotDateTime = DATEADD(DAY, -@PivotDaysInternal, GETDATE())

		SET @LatestTransactionDateInternal = Configuration.f_MakeDate(DATEPART(YEAR, @PivotDateTime), DATEPART(MONTH, @PivotDateTime), 1) - 1
	END

	SET NOCOUNT ON
    
    /* Storing Current Version from the DataWareHouse*/
	IF @VersionIdInternal IS NULL
		SET @VersionIdInternal = Configuration.f_CurrentVersion()
	
	/* Storing the Population ID associated with current run of p_populate*/
	DECLARE @Population TABLE
	(
		PopulationId	INT		NOT NULL
	)
	
	/* LastUpdatedDate changes for Project*/
	DECLARE @ProjectLastUpdatedDate TABLE
	(
		ProjectId		VARCHAR(25) NOT NULL,
		LastUpdatedDate	DATETIME	NOT NULL
	)
	
	/* LastUpdatedDate changes for Component*/
	DECLARE @ComponentLastUpdatedDate TABLE
	(
		ProjectId		VARCHAR(25) NOT NULL,
		ComponentId		VARCHAR(25) NOT NULL,
		LastUpdatedDate	DATETIME	NOT NULL
	)
	
	DBCC CHECKIDENT ('[PublicationControl].Population', RESEED, 0)
	DBCC CHECKIDENT ('[PublicationControl].Population', RESEED)

	BEGIN TRANSACTION

	BEGIN TRY
	
		/* Storing Information for this run of p_populate */
		INSERT INTO
			[PublicationControl].Population
		OUTPUT
			INSERTED.PopulationId
		INTO
			@Population (PopulationId)
		VALUES
		(
			@ExportedFlagInternal,
			GETDATE(),
			NULL,
			@VersionIdInternal,
			@ActivitiesId,
			@DFIDOrganisationIdentifier,	
			@EarliestTransactionDate,	
			@LatestTransactionDateInternal,	
			@MinimumTransactionAmount,
			@ComponentSource,
			@DocumentSource
		)

		DECLARE @PopulationId INT
		SET @PopulationId = (SELECT PopulationId FROM @Population)

		/* Clear down the database table [PublicationControl].PopulationComponent */
		DELETE FROM [PublicationControl].PopulationComponent 
		
		/* Store All Publishable Components to [PublicationControl].PopulationComponent */
		IF @ComponentSource IS NULL
			INSERT INTO [PublicationControl].PopulationComponent SELECT @PopulationId, ComponentCode, StatusFinData FROM [PublicationControl].[stageComponent]
		ELSE
			INSERT INTO [PublicationControl].PopulationComponent EXECUTE('SELECT ' + @PopulationId + ', * FROM (' + @ComponentSource + ') q')
	
		/* Emergency response data should be added to [PublicationControl].PopulationComponent */
		INSERT INTO [PublicationControl].PopulationComponent (PopulationId, ComponentId, StatusFinData)
		SELECT @PopulationId, Eac.ComponentId, 'Release' 
		FROM [PublicationControl].EmergencyAidComponents Eac 
		WHERE (Select COUNT(*) From [PublicationControl].PopulationComponent Pc Where Eac.ComponentId = Pc.ComponentId AND @populationId = Pc.PopulationId ) < 1
			
		/* Store Last Updated Date for Components */
		EXECUTE [PublicationControl].p_PrintProgress N'Populating @ComponentLastUpdatedDate'

		INSERT INTO
			@ComponentLastUpdatedDate
		Select ProjectId, ComponentId, Max(MaxDate) as LastUpdatedDate
		From
			(Select Components.ComponentId as ComponentId, Components.ProjectId as ProjectID, 
			(Select MAX(v)FROM (VALUES (Components.ComponentUpdated), (UnfilteredTransactions.TransactionUpdated), (Budgets.BudgetUpdated), (Sectors.SectorUpdated)) AS value(v)) 
			AS [MaxDate]      
			From 
				(Select [ProjectId], [ComponentId], Version_Number.EndDateTime As ComponentUpdated
				From [ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 0) as Latest_Components,
                [ProjectDataMart].Configuration.Version As Version_Number 
				Where Latest_Components.FromVersionId = Version_Number.VersionId) As Components
				LEFT OUTER JOIN
				(Select [dim_4] as ComponentID, MAX([last_update]) as TransactionUpdated
				From [PublicationControl].UnfilteredTransactions
				Group By [dim_4]) As UnfilteredTransactions
				ON   
				Components.ComponentId = UnfilteredTransactions.ComponentID
				LEFT OUTER JOIN
				(Select [ComponentId], MAX(Version_Number.EndDateTime) as BudgetUpdated 
				From [ProjectDataMart].AgressoTransformation.f_BalanceTransformed(@VersionIdInternal, 0) Latest_Component_Balance,
				[ProjectDataMart].Configuration.Version As Version_Number 
				Where Latest_Component_Balance.FromVersionId = Version_Number.VersionId
				AND ProjectId != ''
				Group By [ComponentId]) As Budgets
				ON
				Components.ComponentId = Budgets.ComponentID
				LEFT OUTER JOIN
				(Select ComponentId, MAX(Version_Number.EndDateTime) as SectorUpdated
				From [ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 0) Latest_Component_Sector,
				[ProjectDataMart].Configuration.Version As Version_Number 
				Where Latest_Component_Sector.FromVersionId = Version_Number.VersionId
				Group By [ComponentId]) As Sectors
				ON
				Components.ComponentId = Sectors.ComponentID) As Component_Update	
			Group BY ComponentId, ProjectId
			
		/* Store Last Updated Date for Projects */
		EXECUTE [PublicationControl].p_PrintProgress N'Populating @ProjectLastUpdatedDate'

		INSERT INTO
			@ProjectLastUpdatedDate
		Select ProjectUpdate.ProjectId, (Select MAX(v)FROM (VALUES (ProjectUpdate.LastUpdatedDate), (DocumentUpdate.LastModified), (ComponentUpdate.LastUpdated)) AS value(v)) AS [LastUpdatedDate]
			From 
				(Select Version_Number.EndDateTime as LastUpdatedDate, Latest_Projects.ProjectId as ProjectId 
				From [ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 0) as Latest_Projects, 
				[ProjectDataMart].Configuration.Version As Version_Number 
			Where Latest_Projects.FromVersionId = Version_Number.VersionId) As ProjectUpdate 
			LEFT OUTER JOIN 
			(Select ProjectID, Max(ExtractionDate) as LastModified from [PublicationControl].PublishedDocuments Group by ProjectID) As DocumentUpdate
			ON 
			ProjectUpdate.ProjectId = DocumentUpdate.ProjectID
			LEFT OUTER JOIN
			(SELECT ProjectId, MAX(LastUpdatedDate) as LastUpdated FROM @ComponentLastUpdatedDate Group by ProjectId) as ComponentUpdate
			ON 
			ProjectUpdate.ProjectId = ComponentUpdate.ProjectId
		

		/*Data Generation for [IATISchema] Tables starts here*/
		BEGIN TRANSACTION

		BEGIN TRY
			SET NOCOUNT ON
			
			/* Setting Variables for Data Generation*/
			IF @VersionIdInternal IS NULL
				SET @VersionIdInternal = Configuration.f_CurrentVersion()

			DELETE FROM [IATISchema].[iati-activities] WHERE [iati-activitiesID] = @ActivitiesId
			
			DELETE FROM [IATISchema].[iati-activity] WHERE [iati-activitiesID] = @ActivitiesId

			DECLARE @GeneratedDateTime [IATISchema].[xsd:datetime]
			SET @GeneratedDateTime = GETDATE()

			IF @DFIDOrganisationIdentifier IS NULL
			BEGIN
				EXECUTE [PublicationControl].p_PrintProgress N'Extracting the DFID Organisation Identifier'
				SET @DFIDOrganisationIdentifier = (SELECT ISNULL(Code, 'GB-1') FROM [Codelist].[OrganisationIdentifier] WHERE NAME='Department for International Development')
			END

			/* Store Meta-Data associated with p_populate run in [iati-activities] */

			EXECUTE [PublicationControl].p_PrintProgress N'Populating iati-activities'

			INSERT INTO
				[IATISchema].[iati-activities]
			VALUES
			(
				@ActivitiesId											-- [iati-activitiesID]
				,'Real Data'											-- [Name]
				,NULL													-- [Notes]
				,DEFAULT												-- [@version]
				,@GeneratedDateTime										-- [@generated-datetime]
				,DEFAULT												-- [ir:registry-record/@xml:lang]				
				,@DFIDOrganisationIdentifier							-- [ir:registry-record/@file-id]				
				,'http://dfid.gov.uk/projects/iati/activities.xml'		-- [ir:registry-record/@source-url]			
				,@DFIDOrganisationIdentifier							-- [ir:registry-record/@publisher-id]			
				,'Funding'												-- [ir:registry-record/@publisher-role]		
				,'aipbeta@dfid.gov.uk'									-- [ir:registry-record/@contact-email]		
				,@DFIDOrganisationIdentifier							-- [ir:registry-record/@donor-id]				
				,10														-- [ir:registry-record/@donor-type]			
				,NULL													-- [ir:registry-record/@donor-country]		
				,'DFID Activity File'									-- [ir:registry-record/@title]				
				,'All Periods'											-- [ir:registry-record/@activity-period]		
				,@GeneratedDateTime						                -- [ir:registry-record/@last-updated-datetime]
				,@GeneratedDateTime										-- [ir:registry-record/@generated-datetime]	
				,1														-- [ir:registry-record/@verification-status]	
				,'application/xml'										-- [ir:registry-record/@format]				
				,'IATI'													-- [ir:registry-record/@license]	
			)

			/* Store projects' data (e.g. level 1 IATI activities) in the [iati-activity] table*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating iati-activity with projects'
			EXECUTE [PublicationControl].p_PrintProgress N'@VersionIdInternal'

			DECLARE @ProjectActivityMapping TABLE
			(
				[ProjectId]				VARCHAR(25)		NOT NULL PRIMARY KEY
				,[iati-activityID]		INT				NOT NULL UNIQUE
			)

			INSERT INTO
				[IATISchema].[iati-activity]
			(
				[iati-activitiesID]
				,[ProjectId]
				,[@hierarchy]
				,[iati-identifier/text()]
				,[other-identifier/@owner-ref]
				,[other-identifier/@owner-name]
				,[other-identifier/text()]
				,[@last-updated-datetime] 
			)
			OUTPUT
				INSERTED.[ProjectId]
				,INSERTED.[iati-activityID]
			INTO
				@ProjectActivityMapping
			SELECT
				@ActivitiesID AS [iati-activitiesID]
				,f_ProjectTransformed.ProjectId AS [ProjectId]
				,1 AS [@hierarchy]
				,@DFIDOrganisationIdentifier + '-' + f_ProjectTransformed.ProjectId AS [iati-identifier/text()]
				,@DFIDOrganisationIdentifier		
				,@DFIDOrganisationName
				,f_ProjectTransformed.ProjectId AS [ProjectIDText]
				,plud.LastUpdatedDate
			FROM
				[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N') 
			INNER JOIN
				@ProjectLastUpdatedDate plud
			ON plud.ProjectId = f_ProjectTransformed.ProjectId
			WHERE
				f_ProjectTransformed.ProjectId IN
				(
					SELECT DISTINCT
						ProjectId
					FROM
						[ProjectDataMart].AgressoTransformation.f_ProjectComponentMappingTransformed(@VersionIdInternal, 'N')
					INNER JOIN
						[PublicationControl].PopulationComponent Component
					ON
						Component.PopulationId = @PopulationId
						AND f_ProjectComponentMappingTransformed.ComponentId = Component.ComponentId
					WHERE
						f_ProjectComponentMappingTransformed.ProjectFlag = 'Y'
						AND f_ProjectComponentMappingTransformed.ComponentFlag = 'Y'
				)
			
			/* Store components' data (e.g. level 2 IATI activities) in the [iati-activity] table*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating iati-activity with components'

			DECLARE @ComponentActivityMapping TABLE
			(
				[ComponentId]			VARCHAR(25)		NOT NULL PRIMARY KEY
				,[ProjectId]			VARCHAR(25)		NOT NULL 
				,[iati-activityID]		INT				NOT NULL UNIQUE
			)

			INSERT INTO
				[IATISchema].[iati-activity]
			(
				[iati-activitiesID]
				,[ProjectId]
				,[ComponentId]
				,[BenefittingCountryCode]
				,[CountryCode]
				,[RegionCode]
				,[@hierarchy]
				,[iati-identifier/text()]
				,[other-identifier/@owner-ref]
				,[other-identifier/@owner-name]
				,[other-identifier/text()]
				,[@last-updated-datetime] 
			)
			OUTPUT
				INSERTED.[ComponentId]
				,INSERTED.[ProjectId]
				,INSERTED.[iati-activityID]
			INTO
				@ComponentActivityMapping
			SELECT
				@ActivitiesID AS [iati-activitiesID]
				,f_ComponentTransformed.ProjectId AS [ProjectId]
				,f_ComponentTransformed.ComponentId AS [ComponentId]
				,NULLIF(f_ComponentTransformed.BenefittingCountryCode, '') AS [BenefittingCountryCode]
				,[MappingBenefittingCountry].IATICountryCode AS [CountryCode]
				,[MappingBenefittingCountry].IATIRegionCode AS [RegionCode]
				,2 AS [@hierarchy]
				,@DFIDOrganisationIdentifier + '-' + f_ComponentTransformed.ComponentId AS [iati-identifier/text()]
				,@DFIDOrganisationIdentifier		
				,@DFIDOrganisationName
				,f_ComponentTransformed.ComponentId AS [ComponentIDText]
				,clud.LastUpdatedDate
			FROM
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			INNER JOIN
				[PublicationControl].PopulationComponent Component
			ON
				Component.PopulationId = @PopulationId
				AND f_ComponentTransformed.ComponentId = Component.ComponentId
			INNER JOIN
				@ComponentLastUpdatedDate clud
			ON clud.ComponentId = f_ComponentTransformed.ComponentId
			LEFT OUTER JOIN
				[PublicationControl].[MappingBenefittingCountry]
			ON
				f_ComponentTransformed.BenefittingCountryCode = MappingBenefittingCountry.BenefittingCountryCode

			/*** activity-website ***/

			-- No Action

			/* Update every entry in the [iati-activity] table with reporting-org value */

			EXECUTE [PublicationControl].p_PrintProgress N'Populating reporting-org'

			UPDATE
				[IATISchema].[iati-activity]
			SET
				[reporting-org/@xml:lang] = NULL
				,[reporting-org/@ref] = @DFIDOrganisationIdentifier
				,[reporting-org/@type] = 10 -- i.e. "Government" entry in OrganisationType code list
				,[reporting-org/text()] = NULL -- text filled automatically by view if no explicit name specified
			WHERE
				[iati-activitiesID] = @ActivitiesId

			
			/* Insert a valid OECD DAC region into the iati-activity table for activities that have a DFID specific Benefitting Country (i.e. a custom region) 
			 * so that the activity meets the IATI 2.01 standard. 	
			 */

			 EXECUTE [PublicationControl].p_PrintProgress N'Populating iati-activity components with OECD DAC regions where they have been allocated a DFID specific region'

			 UPDATE 
				ia
			 SET 
			 	ia.RegionCode = mr.DACRegionCode
			 From 
			 	[IATI].[IATISchema].[iati-activity] ia
			 INNER JOIN
			 	[IATI].[PublicationControl].[MappingDFIDRegionToDACRegion] mr
			 ON 
			 	ia.BenefittingCountryCode = mr.BenefittingCountryCode
			 Where 
			 	 ia.ComponentId IS NOT NULL
			 	 AND ia.BenefittingCountryCode IS NOT NULL
			 	 AND ia.RegionCode IS NULL
			 	 AND ia.CountryCode IS NULL
						
			/* Store participating-org with funding and extending roles along with [iati-activityID] in [IATISchema].[participating-org]*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating participating-org with funding and extending roles'

			INSERT INTO
				[IATISchema].[participating-org]
			(
				--[participating-orgID]
				[iati-activityID]
				,[@xml:lang]
				,[@ref]
				,[@type]
				,[@role]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,data.[@ref] AS [@ref]
				,data.[@type] AS [@type]
				,data.[@role] AS [@role]
			FROM
				[IATISchema].[iati-activity]
			CROSS JOIN
			(
				SELECT 'GB', 10 /* i.e. "Government" entry in OrganisationType code list */, 'Funding'
				UNION ALL
				SELECT @DFIDOrganisationIdentifier, 10 /* i.e. "Government" entry in OrganisationType code list */, 'Extending'
			) data ([@ref], [@type], [@role])
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
			
			/* Store participating-org with implementing role along with [iati-activityID] in [IATISchema].[participating-org]*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating participating-org with implementing role'

			INSERT INTO
				[IATISchema].[participating-org]
			(
				--[participating-orgID]
				[iati-activityID]
				,[@xml:lang]
				,[@ref]
				,[@type]
				,[@role]
			)
			SELECT
				ComponentActivityMapping.[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,f_ComponentTransformed.ChannelCode AS [@ref]
				,NULL AS [@type]
				,'Implementing' AS [@role]
			FROM
				@ComponentActivityMapping ComponentActivityMapping
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				ComponentActivityMapping.ComponentId = f_ComponentTransformed.ComponentId
				AND ISNULL(f_ComponentTransformed.ChannelCode, '') != ''

			/* Store recipient-country along with [iati-activityID] in [IATISchema].[recipient-country]*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating recipient-country'

			INSERT INTO
				[IATISchema].[recipient-country]
			(
				[iati-activityID]		
				,[@code]					
				,[@type]					
				,[@xml:lang]				
				,[@percentage]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,[iati-activity].[CountryCode] AS [@code]
				,NULL AS [@type]					
				,NULL AS [@xml:lang]				
				,NULL AS [@percentage]
				,f_BenefittingCountryTransformed.BenefittingCountryName AS [text()]		
			FROM
				[IATISchema].[iati-activity]
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_BenefittingCountryTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].BenefittingCountryCode = f_BenefittingCountryTransformed.BenefittingCountryCode
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
				AND [iati-activity].CountryCode IS NOT NULL


			/* Store IATI regions along with [iati-activityID] in [IATISchema].[recipient-region]*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating recipient-region with IATI regions'

			INSERT INTO
				[IATISchema].[recipient-region]
			(
				[iati-activityID]		
				,[@code]					
				,[@type]					
				,[@xml:lang]				
				,[@percentage]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,[iati-activity].[RegionCode] AS [@code]
				,NULL AS [@type]					
				,NULL AS [@xml:lang]				
				,NULL AS [@percentage]
				,NULL AS [text()]		
			FROM
				[IATISchema].[iati-activity]
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
				AND [iati-activity].RegionCode IS NOT NULL

			/*** collaboration-type ***/

			UPDATE
				[iati-activity]
			SET
				[collaboration-type/@xml:lang] = NULL
				,[collaboration-type/@code] = 
					CASE
					WHEN f_ComponentBiMultiMarkerTransformed.BiMultiMarkerCode = 1 AND LEFT(f_ComponentTransformed.ChannelCode, 1) = '2' THEN 3
					WHEN f_ComponentBiMultiMarkerTransformed.BiMultiMarkerCode = 3 AND LEFT(f_ComponentTransformed.ChannelCode, 1) = '2' THEN 3
					WHEN f_ComponentBiMultiMarkerTransformed.BiMultiMarkerCode = 1 AND LEFT(f_ComponentTransformed.ChannelCode, 1) = '3' THEN 3
					WHEN f_ComponentBiMultiMarkerTransformed.BiMultiMarkerCode = 1 THEN 1
					WHEN f_ComponentBiMultiMarkerTransformed.BiMultiMarkerCode = 2 THEN 2
					END
				,[collaboration-type/@type] = NULL
				,[collaboration-type/text()] = NULL
			FROM
				[IATISchema].[iati-activity]
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentTransformed.ComponentId
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentBiMultiMarkerTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentBiMultiMarkerTransformed.ComponentId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL

			/*** default-flow-type ***/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating default-flow-type'

			UPDATE
				[iati-activity]
			SET
				[default-flow-type/@xml:lang] = NULL
				,[default-flow-type/@code] = 
					CASE
					WHEN f_ComponentTransformed.ODAOOFMarkerCode = 'ODA' THEN '10'
					WHEN f_ComponentTransformed.ODAOOFMarkerCode = 'OOF' THEN '20'
					END
				,[default-flow-type/@type] = NULL
				,[default-flow-type/text()] = NULL
			FROM
				[IATISchema].[iati-activity]
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentTransformed.ComponentId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL

			/*** default-aid-type ***/

			UPDATE
				[iati-activity]
			SET
				[default-aid-type/@xml:lang] = NULL
				,[default-aid-type/@code] = 
					CASE
					WHEN f_ComponentTransformed.FundingTypeCode = 'GENBUDGETSUPPORT' THEN 'A01'
					WHEN f_ComponentTransformed.FundingTypeCode = 'SECTORBUDGETSUPPORT' THEN 'A02'
					WHEN f_ComponentBiMultiMarkerTransformed.BiMultiMarkerCode = 3 THEN 'B01'
					WHEN f_ComponentBiMultiMarkerTransformed.BiMultiMarkerCode = 2 THEN 'B02'
					WHEN f_ComponentTransformed.FundingTypeCode = 'OTHERBILATERALDONOR' THEN 'B04'
					WHEN f_ComponentTypeOfFinanceTransformed.TypeOfFinanceCode IN ('610', '611', '612', '613', '614', '615', '616', '617', '618') THEN 'F01'
					WHEN sector.DACSectorCode = '91010' THEN 'G01'
					WHEN sector.DACSectorCode = '99820' THEN 'H01'
					WHEN f_ComponentBiMultiMarkerTransformed.BiMultiMarkerCode = 1 THEN 'C01'
					END
				,[default-aid-type/@type] = NULL
				,[default-aid-type/text()] = NULL
			FROM
				[IATISchema].[iati-activity]
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentTransformed.ComponentId
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentBiMultiMarkerTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentBiMultiMarkerTransformed.ComponentId
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTypeOfFinanceTransformed(@VersionIdInternal, 'N')
			ON
				f_ComponentTypeOfFinanceTransformed.Rank = 1
				AND [iati-activity].ComponentId = f_ComponentTypeOfFinanceTransformed.ComponentId
			LEFT OUTER JOIN
			(
				SELECT
					f_ComponentInputSectorTransformed.ComponentId
					,f_InputSectorTransformed.DACSectorCode
					,ROW_NUMBER() OVER (PARTITION BY f_ComponentInputSectorTransformed.ComponentId ORDER BY SUM(Percentage) DESC) AS Rank
				FROM
					[ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 'N')
				INNER JOIN
					[ProjectDataMart].AgressoTransformation.f_InputSectorTransformed(@VersionIdInternal, 'N')
				ON
					f_ComponentInputSectorTransformed.InputSectorCode = f_InputSectorTransformed.InputSectorCode
				GROUP BY
					f_ComponentInputSectorTransformed.ComponentId
					,f_InputSectorTransformed.DACSectorCode
			) sector
			ON
				sector.Rank = 1
				AND [iati-activity].ComponentId = sector.ComponentId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL

			/*** default-finance-type ***/

			UPDATE
				[iati-activity]
			SET
				[default-finance-type/@xml:lang] = NULL
				,[default-finance-type/@code] = f_ComponentTypeOfFinanceTransformed.TypeOfFinanceCode
				,[default-finance-type/@type] = NULL
				,[default-finance-type/text()] = NULL
			FROM
				[IATISchema].[iati-activity]
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentTransformed.ComponentId
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTypeOfFinanceTransformed(@VersionIdInternal, 'N')
			ON
				f_ComponentTypeOfFinanceTransformed.Rank = 1
				AND [iati-activity].ComponentId = f_ComponentTypeOfFinanceTransformed.ComponentId
			INNER JOIN
				[Codelist].FinanceType
			ON
				f_ComponentTypeOfFinanceTransformed.TypeOfFinanceCode = FinanceType.Code
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL

			/* other-identifier */

			-- No Action

			/* Populate Project Title along with [iati-activityID] in [IATISchema].[activity/title]*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating activity/title for projects and components'

			INSERT INTO
				[IATISchema].[activity/title]
			(
				[iati-activityID]	
				,[@xml:lang]			
				,[text()]			
			)
			SELECT
				ProjectActivityMapping.[iati-activityID] AS [iati-activityID]	
				,NULL
				,f_ProjectTransformed.ProjectTitle
			FROM
				@ProjectActivityMapping ProjectActivityMapping
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N')
			ON
				ProjectActivityMapping.ProjectId = f_ProjectTransformed.ProjectId
			UNION ALL
			SELECT
				ComponentActivityMapping.[iati-activityID] AS [iati-activityID]	
				,NULL
				,f_ComponentTransformed.ComponentTitle
			FROM
				@ComponentActivityMapping ComponentActivityMapping
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				ComponentActivityMapping.ComponentId = f_ComponentTransformed.ComponentId

			/* Populate Project Description along with [iati-activityID] in [IATISchema].[activity/description]*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating activity/description for projects and components'

			INSERT INTO
				[IATISchema].[activity/description]
			(
				[iati-activityID]	
				,[@xml:lang]			
				,[text()]			
			)
			SELECT
				ProjectActivityMapping.[iati-activityID] AS [iati-activityID]	
				,NULL
				,f_ProjectTransformed.MostRecentPurpose
			FROM
				@ProjectActivityMapping ProjectActivityMapping
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N')
			ON
				ProjectActivityMapping.ProjectId = f_ProjectTransformed.ProjectId
			WHERE
				f_ProjectTransformed.MostRecentPurpose != ''

			/* Populate Component (Title/Description) along with [iati-activityID] in [IATISchema].[activity/description]*/
			
			INSERT INTO 
				IATISchema.[activity/description] 
			SELECT 
				[activity/title].[iati-activityID]
				,[activity/title].[@xml:lang]
				,NULL
				,'Title: ' + [activity/title].[text()]
			from 
				IATISchema.[activity/title]
			LEFT OUTER JOIN 
				IATISchema.[activity/description]
				on [activity/description].[iati-activityID] = [activity/title].[iati-activityID]
			WHERE 
				[activity/description].[text()] is null

			/* Populate Sector along with [iati-activityID] in [IATISchema].[sector]*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating sector'

			INSERT INTO [IATISchema].[sector]
			(
				[iati-activityID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[@other-code]
				,[@vocabulary]
				,[@percentage]
				,[text()]
			)
			SELECT
				ComponentActivityMapping.[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,f_InputSectorTransformed.DACSectorCode AS [@code]
				,NULL AS [@type]
				,NULL AS [@other-code]
				,NULL AS [@vocabulary] -- 'DAC' is the default
				,NULLIF(f_ComponentInputSectorTransformed.percentage, 100) AS [@percentage]
				,f_InputSectorTransformed.DACSectorName As [text()]
			FROM
				@ComponentActivityMapping ComponentActivityMapping
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 'N')
			ON
				f_ComponentInputSectorTransformed.Percentage != 0
				AND ComponentActivityMapping.ComponentId = f_ComponentInputSectorTransformed.ComponentId
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_InputSectorTransformed(@VersionIdInternal, 'N')
			ON
				f_ComponentInputSectorTransformed.InputSectorCode = f_InputSectorTransformed.InputSectorCode
			INNER JOIN
				[Codelist].DAC5DigitSector
			ON
				f_InputSectorTransformed.DACSectorCode = DAC5DigitSector.Code

			
			/* Populate activity-date for projects along with [iati-activityID] in [IATISchema].[activity-date]*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating activity-date for projects'

			INSERT INTO
				[IATISchema].[activity-date]
			(
				[iati-activityID]
				,[@type]
				,[@xml:lang]
				,[@iso-date]
				,[text()]
			)
			SELECT * FROM
				(
					SELECT
					[iati-activity].[iati-activityID] AS [iati-activityID]
					,ActivityDateType.Code AS [@type]
					,NULL AS [@xml:lang]
					,CASE 
					WHEN ActivityDateType.Code='1' THEN f_ProjectTransformed.OperationalStartDate
					WHEN ActivityDateType.Code='3' THEN f_ProjectTransformed.OperationalEndDate
					WHEN ActivityDateType.Code='2' THEN f_ProjectTransformed.ApprovalDate
					WHEN ActivityDateType.Code='4' AND f_ProjectTransformed.OperationalEndDate<GETDATE() THEN f_ProjectTransformed.OperationalEndDate	
					END AS [@iso-date]
					,NULL AS [text()]	
				FROM
					[IATISchema].[iati-activity]
				INNER JOIN 
					[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N')
				ON
					[iati-activity].ProjectId = f_ProjectTransformed.ProjectId
				CROSS JOIN
					[Codelist].ActivityDateType
				WHERE
					[iati-activity].[iati-activitiesID] = @ActivitiesId
					AND [iati-activity].ComponentId IS NULL
				) A
			WHERE 
				[@iso-date] IS NOT NULL	 
				
			/* Populate activity-date for components along with [iati-activityID] in [IATISchema].[activity-date]*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating activity-date for components'

			INSERT INTO
				[IATISchema].[activity-date]
			(
				[iati-activityID]
				,[@type]
				,[@xml:lang]
				,[@iso-date]
				,[text()]
			)
			SELECT * FROM
				(
					SELECT
					[iati-activity].[iati-activityID] AS [iati-activityID]
					,ActivityDateType.Code AS [@type]
					,NULL AS [@xml:lang]
					,CASE 
					WHEN ActivityDateType.Code='1' THEN f_ComponentTransformed.OperationalStartDate
					WHEN ActivityDateType.Code='3' THEN f_ComponentTransformed.OperationalEndDate
					WHEN ActivityDateType.Code='2' THEN f_ComponentTransformed.OperationalStartDate
					WHEN ActivityDateType.Code='4' AND f_ComponentTransformed.OperationalEndDate<GETDATE() THEN f_ComponentTransformed.OperationalEndDate	
					END AS [@iso-date]
					,NULL AS [text()]	
				FROM
					[IATISchema].[iati-activity]
				INNER JOIN 
					[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
				ON
					[iati-activity].ComponentId = f_ComponentTransformed.ComponentId
				----CROSS JOIN (SELECT * FROM $(CodeListSchema).ActivityDateType WHERE Code LIKE '%planned') ActivityDateType
				CROSS JOIN
					[Codelist].ActivityDateType
				WHERE
					[iati-activity].[iati-activitiesID] = @ActivitiesId
					AND [iati-activity].ComponentId IS NOT NULL -- i.e. the activity is a component
				) A
			WHERE 
				[@iso-date] IS NOT NULL

			/* Remove end-date from 1st jan, 2099 */
			DELETE FROM [IATISchema].[activity-date] WHERE [@type] in ('3','4') and [@iso-date] >= '20990101'

			/* Update activity-status for this p_populate activity  in [IATISchema].[iati-activity]*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating activity-status'

			UPDATE
				[IATISchema].[iati-activity]
			SET
				[activity-status/@xml:lang] = NULL
				,[activity-status/@code] = CASE 
				WHEN f_ProjectTransformed.StageCode IN ('0', '1', '2', '3', '4') THEN 1
				WHEN f_ProjectTransformed.StageCode IN ('5') THEN 2
				WHEN f_ProjectTransformed.StageCode IN ('6') THEN 3
				WHEN f_ProjectTransformed.StageCode IN ('7') THEN 4
				ELSE NULL
				END
				,[activity-status/@type] = NULL
				,[activity-status/text()] = NULL -- text filled automatically by view if no explicit name specified
			FROM
				[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N')
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ProjectId = f_ProjectTransformed.ProjectId

			/* Populate contact-info along with [iati-activityID] in [IATISchema].[contact-info]*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating contact-info'

			INSERT INTO
				[IATISchema].[contact-info]
			(
				[iati-activityID]
				,[organisation/text()]
				,[person-name/@xml:lang]
				,[person-name/text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,(SELECT Name FROM [Codelist].OrganisationIdentifier WHERE Code = @DFIDOrganisationIdentifier) AS [organisation/text()]
				,NULL AS [person-name/@xml:lang]
				,NULL AS [person-name/text()]
			FROM
				[IATISchema].[iati-activity]
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId

			/* Populate Details of contact-info along with [iati-activityID] in [IATISchema].[contact-info/details]*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating contact-info/details'

			INSERT INTO
				 [IATISchema].[contact-info/details]
			(
				[contact-infoID]
				,[telephone/text()]
				,[email/text()]
				,[mailing-address/text()]
			)
			SELECT
				 [contact-info].[contact-infoID] AS [contact-infoID]
				,'+44 (0) 1355 84 3132' AS [telephone/text()]
				,'enquiry@dfid.gov.uk' AS [email/text()]
				,'Public Enquiry Point, Abercrombie House, Eaglesham Road, East Kilbride, Glasgow G75 8EA' AS [mailing-address/text()]
			FROM
				[IATISchema].[contact-info]
			INNER JOIN
				[IATISchema].[iati-activity]
			ON
				[contact-info].[iati-activityID] = [iati-activity].[iati-activityID]
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId

			/* Update default-tied-status for this p_populate activity  in [IATISchema].[iati-activity]*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating default-tied-status'

			UPDATE
				[IATISchema].[iati-activity]
			SET
				[default-tied-status/@xml:lang] = NULL
				,[default-tied-status/@code] = 5 -- i.e. "Untied" entry in TiedStatus code list
				,[default-tied-status/@type] = NULL 
				,[default-tied-status/text()] = NULL -- text filled automatically by view if no explicit name specified
			WHERE
				[iati-activitiesID] = @ActivitiesId

			/*** policy-marker ***/
			/* Populate policy-marker info along with [iati-activityID] in [IATISchema].[policy-marker]*/
			
			/* Step 1 */
			INSERT INTO
				[IATISchema].[policy-marker]
			(
				[iati-activityID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[@vocabulary]
				,[@significance]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,1 AS [@code]
				,NULL AS [@type]
				,'DAC' AS [@vocabulary]
				,CASE
				WHEN f_ProjectTransformed.CCOGenderEqualityCode = 'PRINCIPAL' THEN 2
				WHEN f_ProjectTransformed.CCOGenderEqualityCode = 'SIGNIFICANT' THEN 1
				ELSE 0
				END AS [@significance]
				,NULL AS [text()]
			FROM
				[IATISchema].[iati-activity]
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N')
			ON
				--f_ProjectTransformed.CCOGenderEqualityCode != ''
				[iati-activity].ProjectId = f_ProjectTransformed.ProjectId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
			
			/* Step 2 */
			INSERT INTO
				[IATISchema].[policy-marker]
			(
				[iati-activityID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[@vocabulary]
				,[@significance]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,2 AS [@code]
				,NULL AS [@type]
				,'DAC' AS [@vocabulary]
				,CASE
				WHEN f_ProjectTransformed.DSOClimateChange = 'Principal' THEN 2
				WHEN f_ProjectTransformed.DSOClimateChange = 'Significant' THEN 1
				ELSE 0
				END AS [@significance]
				,NULL AS [text()]
			FROM
				[IATISchema].[iati-activity]
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N')
			ON
				--f_ProjectTransformed.DSOClimateChange != ''
				[iati-activity].ProjectId = f_ProjectTransformed.ProjectId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
			
			/* Step 3 */
			INSERT INTO
				[IATISchema].[policy-marker]
			(
				[iati-activityID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[@vocabulary]
				,[@significance]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,3 AS [@code]
				,NULL AS [@type]
				,'DAC' AS [@vocabulary]
				,CASE
				WHEN
					SUM(
						CASE
						WHEN
							f_ComponentInputSectorTransformed.LineNumber = 1 AND
							(
								f_ComponentInputSectorTransformed.InputSectorCode IN ('15130', '15150', '15210', '15220', '15230', '15240', '15261')
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '1512%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '1514%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '1516%'
							)
						THEN
							1
						ELSE
							0			
						END
					) > 0
				THEN
					2
				WHEN
					SUM(
						CASE
						WHEN
							f_ComponentInputSectorTransformed.InputSectorCode IN ('15130', '15150', '15210', '15220', '15230', '15240', '15261')
							OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '1512%'
							OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '1514%'
							OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '1516%'
						THEN
							1
						ELSE
							0			
						END
					) > 0
				THEN
					1
				ELSE
					0
				END AS [@significance]
				,NULL AS [text()]
			FROM
				[IATISchema].[iati-activity]
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentInputSectorTransformed.ComponentId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
			GROUP BY
				[iati-activity].[iati-activityID]
			
			/* Step 4 */
			INSERT INTO
				[IATISchema].[policy-marker]
			(
				[iati-activityID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[@vocabulary]
				,[@significance]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,4 AS [@code]
				,NULL AS [@type]
				,'DAC' AS [@vocabulary]
				,CASE
				WHEN
					SUM(
						CASE
						WHEN
							(
								f_ComponentInputSectorTransformed.InputSectorCode IN ('33210', '25010')
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '240%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '311%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '312%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '313%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '321%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '322%'
							)
						THEN
							percentage
						ELSE
							0			
						END
					) > 50
				THEN
					2
				WHEN
					SUM(
						CASE
						WHEN
							f_ComponentInputSectorTransformed.LineNumber = 1 AND
							(
								f_ComponentInputSectorTransformed.InputSectorCode IN ('33210', '25010')
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '240%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '311%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '312%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '313%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '321%'
								OR f_ComponentInputSectorTransformed.InputSectorCode LIKE '322%'
							)
						THEN
							1
						ELSE
							0			
						END
					) > 0
					AND SUM(CASE WHEN f_ComponentInputSectorTransformed.InputSectorCode IN ('33110', '33120', '33130', '33140', '33150', '33181') THEN 1 ELSE 0 END) > 0
				THEN
					1
				ELSE
					0
				END AS [@significance]
				,NULL AS [text()]
			FROM
				[IATISchema].[iati-activity]
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentInputSectorTransformed.ComponentId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
			GROUP BY
				[iati-activity].[iati-activityID]
			
			/* Step 5 */
			INSERT INTO
				[IATISchema].[policy-marker]
			(
				[iati-activityID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[@vocabulary]
				,[@significance]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,5 AS [@code]
				,NULL AS [@type]
				,'DAC' AS [@vocabulary]
				,CASE
				WHEN SUM(CASE WHEN f_ComponentInputSectorTransformed.LineNumber = 1 AND f_ComponentInputSectorTransformed.InputSectorCode IN ('41031') THEN 1 ELSE 0 END) > 0 THEN 2
				WHEN SUM(CASE WHEN f_ComponentInputSectorTransformed.InputSectorCode IN ('41031') THEN 1 ELSE 0 END) > 0 THEN 1
				ELSE 0
				END AS [@significance]
				,NULL AS [text()]
			FROM
				[IATISchema].[iati-activity]
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentInputSectorTransformed.ComponentId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
			GROUP BY
				[iati-activity].[iati-activityID]
			
			/* Step 6 */
			INSERT INTO
				[IATISchema].[policy-marker]
			(
				[iati-activityID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[@vocabulary]
				,[@significance]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,6 AS [@code]
				,NULL AS [@type]
				,'DAC' AS [@vocabulary]
				,CASE
				WHEN SUM(CASE WHEN f_ComponentInputSectorTransformed.InputSectorCode IN ('41033') THEN percentage ELSE 0 END) >= 50 THEN 2
				WHEN SUM(CASE WHEN f_ComponentInputSectorTransformed.InputSectorCode IN ('41033') THEN percentage ELSE 0 END) > 0 THEN 1
				ELSE 0
				END AS [@significance]
				,NULL AS [text()]
			FROM
				[IATISchema].[iati-activity]
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentInputSectorTransformed.ComponentId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
			GROUP BY
				[iati-activity].[iati-activityID]
			
			/* Step 7 */
			INSERT INTO
				[IATISchema].[policy-marker]
			(
				[iati-activityID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[@vocabulary]
				,[@significance]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,7 AS [@code]
				,NULL AS [@type]
				,'DAC' AS [@vocabulary]
				,CASE
				WHEN SUM(CASE WHEN f_ComponentInputSectorTransformed.InputSectorCode IN ('23010', '23030', '80017', '80019', '80023', '41032') THEN 1 ELSE 0 END) > 0 THEN
					CASE f_ProjectTransformed.DSOClimateChange WHEN 'Principal' THEN 2 WHEN 'Significant' THEN 1 ELSE 0 END
				ELSE 0
				END AS [@significance]
				,NULL AS [text()]
			FROM
				[IATISchema].[iati-activity]
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ProjectId = f_ProjectTransformed.ProjectId
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentInputSectorTransformed.ComponentId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
			GROUP BY
				[iati-activity].[iati-activityID]
				,f_ProjectTransformed.DSOClimateChange
			
			/* Step 8 */
			INSERT INTO
				[IATISchema].[policy-marker]
			(
				[iati-activityID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[@vocabulary]
				,[@significance]
				,[text()]
			)
			SELECT
				[iati-activity].[iati-activityID] AS [iati-activityID]
				,NULL AS [@xml:lang]
				,8 AS [@code]
				,NULL AS [@type]
				,'DAC' AS [@vocabulary]
				,CASE
				WHEN SUM(CASE WHEN f_ComponentInputSectorTransformed.InputSectorCode IN ('12262', '14010', '14015', '14040', '31110', '31130', '41010', '41050', '74010', '80018', '80020') THEN 1 ELSE 0 END) > 0 THEN
					CASE f_ProjectTransformed.DSOClimateChange WHEN 'Principal' THEN 2 WHEN 'Significant' THEN 1 ELSE 0 END
				ELSE 0
				END AS [@significance]
				,NULL AS [text()]
			FROM
				[IATISchema].[iati-activity]
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ProjectId = f_ProjectTransformed.ProjectId
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 'N')
			ON
				[iati-activity].ComponentId = f_ComponentInputSectorTransformed.ComponentId
			WHERE
				[iati-activity].[iati-activitiesID] = @ActivitiesId
				AND [iati-activity].ComponentId IS NOT NULL
			GROUP BY
				[iati-activity].[iati-activityID]
				,f_ProjectTransformed.DSOClimateChange

					
			/* Populate geolocation data along with [iati-activityID] in [IATISchema].[location]*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Adding geolocation data';
				  
			INSERT INTO [IATISchema].[location]
					   ([iati-activityID]
					   ,[@ref]
					   ,[location-id/@vocabulary]
					   ,[location-id/@code]
					   ,[name/narrative/@xml:lang]
					   ,[name/narrative]
					   ,[description/narrative/@xml:lang]
					   ,[description/narrative]
					   ,[activity-description/narrative/@xml:lang]
					   ,[activity-description/narrative]
					   ,[administrative/@level]
					   ,[administrative/@code]
					   ,[administrative/@vocabulary]
					   ,[point/@srsName]
					   ,[point/pos]
					   ,[exactness/@code]
					   ,[location-reach/@code]
					   ,[location-class/@code]
					   ,[feature-designation/@code])
				select 
					ia.[iati-activityID]
					,null as [@ref]
					,null as [location-id/@vocabulary]
					,null as [location-id/@code]
					,null as [name/narrative/@xml:lang]
					,ld.[name/text()]
					,null as [description/narrative/@xml:lang]
					,ld.[administrative/text()] as [description/narrative]
					,null as [activity-description/narrative/@xml:lang]
					,null as [activity-description/narrative]
					,null as [adaministrative/@level] -- deprecated
					,null as [adaministrative/@code] -- deprecated
					,null as [adaministrative/@vocabulary] -- deprecated
					,'http://www.opengis.net/def/crs/EPSG/0/4326' as [point/@srsName]
					,STR([coordinates/@latitude],20,20) + ' ' + STR([coordinates/@longitude],20,20) as [point/pos]
					,case 
						when ld.[coordinates/@precision] in (1,3,4,6) THEN 1
						else 2 
					end as [exactness/@code]
					,1 as [location-reach/@code] --activity =1 ; beneficiary location =2
					,case 
						when ld.[location-type/@code] like 'PPL%' THEN 2
						else 1   -- ADM%, PCL%
					end AS [location-class/@code]
					,ld.[location-type/@code] as [feature-designation/@code]
				FROM
					[PublicationControl].[LocationData] ld
				Inner Join
					[IATISchema].[iati-activity] ia
				ON
					ld.projectID = ia.ProjectId	and ia.ComponentId IS NULL


			/*** budgets and transactions building segments are starting from here ***/
			
			
			/* Storing Component wise budget related value in temporary Table*/
			EXECUTE [PublicationControl].p_PrintProgress N'Building budget values';

			IF OBJECT_ID('tempdb..#temp', 'U') IS NOT NULL
				DROP TABLE #temp

			
			SELECT
				ComponentActivityMapping.[iati-activityID]
				,ComponentActivityMapping.ComponentId AS [ComponentId]
				,f_BalanceTransformed.FiscalYear
				,f_BalanceTransformed.BudgetOriginal
				,f_BalanceTransformed.BudgetCurrent
				,f_BalanceTransformed.FiscalPeriod
			INTO
				#temp
			FROM
				@ComponentActivityMapping ComponentActivityMapping
			INNER JOIN
				[PublicationControl].PopulationComponent
			ON
				PopulationComponent.PopulationId = @PopulationId
				AND CASE WHEN PopulationComponent.StatusFinData IN (N'HideFinData', N'HideBudgetOnly') THEN 'N' ELSE 'Y' END = 'Y'
				AND ComponentActivityMapping.ComponentId = PopulationComponent.ComponentId
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_BalanceTransformed(@VersionIdInternal, 'N')
			ON
				ComponentActivityMapping.ComponentId = f_BalanceTransformed.ComponentId
			INNER JOIN 
				[ProjectDataMart].AgressoSourceData.f_aglrelvalue(@VersionIdInternal,'N')
			ON 
				f_BalanceTransformed.AccountCode = f_aglrelvalue.att_value and f_aglrelvalue.attribute_id = 'A0' and f_aglrelvalue.rel_attr_id = 'S14' and f_aglrelvalue.rel_value = 'yes'
			
			
			/* Populate annual activity budgets along with [iati-activityID] in [IATISchema].[budget]*/
			EXECUTE [PublicationControl].p_PrintProgress N'Inserting annual activity budgets into budget table';

			INSERT INTO
				[IATISchema].[budget]
				(
					[iati-activityID]
					,[@type]
					,[period-start/@iso-date]
					,[period-start/text()]
					,[period-end/@iso-date]
					,[period-end/text()]
					,[value/@currency]
					,[value/@value-date]
					,[value/text()]
				)
			SELECT	
				FQRange.[iati-activityID]
				,CASE WHEN (SUM(FQRange.[budget-current]) = SUM(FQRange.[budget-original])) THEN 'Original' ELSE 'Revised' END as [@type]
				,CASE
					WHEN (FYQuarter = 1) THEN Configuration.f_MakeDate(FiscalYear, 4, 1)
					WHEN (FYQuarter = 2) THEN Configuration.f_MakeDate(FiscalYear, 7, 1) 
					WHEN (FYQuarter = 3) THEN Configuration.f_MakeDate(FiscalYear, 10, 1) 
					WHEN (FYQuarter = 4) THEN Configuration.f_MakeDate(FiscalYear + 1, 1, 1)
				END AS [period-start/@iso-date]
				,NULL
				,CASE 
					WHEN (FYQuarter = 1) THEN Configuration.f_MakeDate(FiscalYear, 6, 30) 
					WHEN (FYQuarter = 2) THEN Configuration.f_MakeDate(FiscalYear, 9, 30) 
					WHEN (FYQuarter = 3) THEN Configuration.f_MakeDate(FiscalYear, 12, 31)
					WHEN (FYQuarter = 4) THEN Configuration.f_MakeDate(FiscalYear + 1, 3, 31) 
				END AS [period-end/@iso-date]
				,NULL
				,'GBP' AS [value/@currency]
				,[IATISchema].[f_ActivityActualStartDate]([iati-activityID]) AS [value/@value-date]
				,SUM(FQRange.[budget-current]) AS [value/text()]				
			FROM
				(
					SELECT [iati-activityID]
							,FiscalYear						   
							,CASE
								WHEN (FiscalPeriod < 4) THEN 1
								WHEN (FiscalPeriod < 7) THEN 2
								WHEN (FiscalPeriod < 10) THEN 3 
								ELSE 4
							END AS FYQuarter
							,SUM(BudgetCurrent) AS [budget-current]
							,SUM(BudgetOriginal) AS [budget-original]
						FROM #temp
						group by
							[iati-activityID]
							,FiscalYear
							,FiscalPeriod					
				)FQRange
			GROUP BY
				FQRange.[iati-activityID]
				,FQRange.FiscalYear
				,FQRange.FYQuarter
			HAVING
				SUM(FQRange.[budget-current]) != 0
			
			/* Populate aggregated budgets (commitments) along with [iati-activityID] in [IATISchema].[transaction]*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Inserting aggregated budgets (commitments) into transaction table';

			INSERT INTO
				[IATISchema].[transaction]
			(
				[iati-activityID]
				,[IsExcluded]
				,[OriginalValue]
				,[@flow]
				,[value/@currency]	
				,[value/@value-date]	
				,[value/@type]		
				,[value/text()]	
				,[transaction-type/@xml:lang]
				,[transaction-type/@code]
				,[transaction-type/@type]
				,[transaction-type/text()]
				,[transaction-date/@iso-date]
				,[transaction-date/text()]	
			)
			SELECT
				[iati-activityID]
				ComponentId
				,0 AS IsExcluded
				,SUM(BudgetCurrent) AS OriginalValue
				,NULL AS [@flow]
				,NULL AS [value/@currency]	
				,[IATISchema].[f_ActivityActualStartDate]([iati-activityID]) AS [value/@value-date]
				,NULL AS [value/@type]		
				,SUM(BudgetCurrent) AS [value/text()]		
				,NULL AS [transaction-type/@xml:lang]
				,'C' AS [transaction-type/@code]
				,NULL AS [transaction-type/@type]
				,NULL AS [transaction-type/text()]
				,[IATISchema].[f_ActivityActualStartDate]([iati-activityID]) AS [transaction-date/@iso-date]
				,'Total Commitment to ' + Convert(nvarchar,([IATISchema].[f_ActivityActualEndDate]([iati-activityID])),106) AS [transaction-date/text()]	
			FROM
				#temp
			GROUP BY
				[iati-activityID]
			HAVING
				SUM(BudgetCurrent) != 0
			
			/* Dropping [PublicationControl].UnfilteredTransactions Table*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Dropping transaction table';

			IF OBJECT_ID('[PublicationControl].UnfilteredTransactions', 'U') IS NOT NULL
				DROP TABLE [PublicationControl].UnfilteredTransactions;

			EXECUTE [PublicationControl].p_PrintProgress N'Populating transaction with spend';

			WITH
				Main AS
			(
				SELECT
					[iati-activity].[iati-activityID],
					f_agltransact.account,
					f_agltransact.amount,
					f_agltransact.apar_id,
					f_agltransact.apar_type,
					f_agltransact.client,
					f_agltransact.cur_amount,
					f_agltransact.currency,
					f_agltransact.dc_flag,
					f_agltransact.description,
					f_agltransact.dim_1,
					f_agltransact.dim_4,
					f_agltransact.dim_7,
					f_agltransact.ext_inv_ref,
					f_agltransact.ext_ref,
					f_agltransact.fiscal_year,
					f_agltransact.last_update,
					f_agltransact.order_id,
					f_agltransact.period,
					f_agltransact.sequence_no,
					f_agltransact.status,
					f_agltransact.tax_code,
					f_agltransact.tax_system,
					f_agltransact.trans_date,
					f_agltransact.trans_id,
					f_agltransact.user_id,
					f_agltransact.voucher_date,
					f_agltransact.voucher_no,
					f_agltransact.voucher_type,
					f_agltransact.agrtid,
					CASE WHEN f_agltransact.account <= '4999' THEN 'Y' ELSE 'N' END AS IsExpenditureAccount,
					/* Handle promissory notes and provisions */
					CASE WHEN (f_agltransact.account <= '4999' AND f_agltransact.account != '2323') OR (f_agltransact.account IN ('5821', '6002', '6008', '6013', '6020', '6022')) THEN 'Y' ELSE 'N' END AS IsIncludedAccount,
					CASE WHEN SUM(CASE WHEN f_agltransact.account IN ('6001', '6003', '6004', '6005', '6007', '6009', '6010', '6012', '6014', '6015', '6021', '6023', '6024') THEN 1 ELSE 0 END) OVER (PARTITION BY f_agltransact.client, f_agltransact.voucher_type, f_agltransact.voucher_no) > 0 THEN 'Y' ELSE 'N' END AS IsProvisionRelated,
					CASE WHEN PopulationComponent.StatusFinData = N'HideFinData' THEN 'Y' ELSE 'N' END AS IsProcurementExcluded,
					CASE WHEN ExclusionProject.ID IS NULL THEN 'N' ELSE 'Y' END AS IsProjectExcluded,
					CASE WHEN ExclusionComponent.ID IS NULL THEN 'N' ELSE 'Y' END AS IsComponentExcluded,
					CASE WHEN ExclusionAccount.AccountCode IS NULL OR ExclusionAccount.ReplacementAccountName IS NOT NULL THEN 'N' ELSE 'Y' END AS IsAccountExcluded,
					CASE WHEN ExclusionVoucherType.VoucherTypeCode IS NULL OR ExclusionVoucherType.ReplacementSupplierName IS NOT NULL THEN 'N' ELSE 'Y' END AS IsVoucherTypeExcluded,
					CASE WHEN ExclusionBudgetCentre.BudgetCentreCode IS NULL THEN 'N' ELSE 'Y' END AS IsBudgetCentreExcluded,
					/* Need to revise*/
					'N' AS IsBenefittingCountryExcluded,
					CASE WHEN f_agltransact.voucher_type = 'PR' AND f_agltransact.voucher_no = 400136721 THEN 'Y' ELSE 'N' END AS IsTransactionExcluded,
					/* Need to revise*/
					CASE
						WHEN ExclusionSupplier.ID IS NOT NULL THEN 'Y' 
						WHEN SupplierInclusionList.SupplierId IS NOT NULL THEN 'N' 
						ELSE 'Y' 
					END AS IsSupplierExcluded,
					CASE WHEN @EarliestTransactionDate <= f_agltransact.last_update AND f_agltransact.last_update < DATEADD(DAY, 1, @LatestTransactionDateInternal) THEN 'N' ELSE 'Y' END AS IsDateExcluded,
					CASE WHEN ABS(f_agltransact.amount) >= @MinimumTransactionAmount THEN 'N' ELSE 'Y' END AS IsTransactionLineAmountExcluded,
					SUM(amount) OVER (PARTITION BY f_agltransact.client, f_agltransact.voucher_type, f_agltransact.voucher_no) AS TransactionTotal,
					CASE WHEN SUM(amount) OVER (PARTITION BY f_agltransact.client, f_agltransact.voucher_type, f_agltransact.voucher_no) > 25000 THEN 'Y' ELSE 'N' END AS IsGreaterThan25K,
					f_asuheader.apar_name AS SupplierName,
					f_acuheader.apar_name AS CustomerName,
					amount AS IATIAmount,
					CASE WHEN ExclusionAccount.ReplacementAccountName IS NOT NULL THEN ExclusionAccount.ReplacementAccountName ELSE f_aglaccounts.description END AS IATIAccountName,
					
					CASE
					WHEN ExclusionVoucherType.ReplacementSupplierName IS NOT NULL THEN 'Excluded'
					WHEN f_agltransact.apar_id = '' THEN 'Not available'
					WHEN f_agltransact.apar_id LIKE 'S%' OR f_agltransact.apar_id LIKE 'C%' THEN 'Not available'
					WHEN f_agltransact.apar_type = 'R' THEN 'Not available'
					WHEN ExclusionSupplier.ID IS NOT NULL THEN 'Excluded'
					WHEN SupplierInclusionList.SupplierId IS NULL THEN 'Excluded'
					WHEN ExclusionSupplierProject.ID IS NOT NULL THEN 'Excluded'
					WHEN [iati-activity].BenefittingCountryCode = 'AF' THEN 'Excluded'
					ELSE f_aglrelvalue.rel_value
					END AS IATIChannelCode,		
										
					CASE
					WHEN f_agltransact.account IN ('5821', '6002', '6008', '6013', '6020', '6022') AND f_asuheader.apar_name = 'Department for International Development' THEN 'Not available'
					WHEN ExclusionVoucherType.ReplacementSupplierName IS NOT NULL THEN ExclusionVoucherType.ReplacementSupplierName
					WHEN f_agltransact.apar_id = '' THEN 'Correction'
					WHEN f_agltransact.apar_id LIKE 'S%' OR f_agltransact.apar_id LIKE 'C%' THEN 'Staff Member'
					WHEN f_agltransact.apar_type = 'R' THEN 'Customer'
					WHEN ExclusionSupplier.ID IS NOT NULL THEN 'Supplier Name Withheld' 
					WHEN SupplierInclusionList.SupplierId IS NULL THEN 'Supplier Name Withheld'
					WHEN ExclusionSupplierProject.ID IS NOT NULL THEN 'Supplier Name Withheld' 
					WHEN [iati-activity].BenefittingCountryCode = 'AF' THEN 'Supplier Name Withheld'
					ELSE f_asuheader.apar_name
					END AS IATICustomerSupplier
				FROM
					[IATISchema].[iati-activity]
				INNER JOIN
					[PublicationControl].PopulationComponent
				ON
					PopulationComponent.PopulationId = @PopulationId
					AND [iati-activity].ComponentId = PopulationComponent.ComponentId
				INNER JOIN
					[ProjectDataMart].AgressoSourceData.f_agltransact(@VersionIdInternal, 'N')
				ON
					f_agltransact.client = 'DF'
					AND [iati-activity].ComponentId = f_agltransact.dim_4
				INNER JOIN
					[ProjectDataMart].AgressoSourceData.f_aglaccounts(@VersionIdInternal, 'N')
				ON
					f_aglaccounts.client = 'DF'
					AND f_agltransact.account = f_aglaccounts.account
				LEFT OUTER JOIN
					[ProjectDataMart].AgressoSourceData.f_asuheader(@VersionIdInternal, 'N')
				ON
					f_agltransact.apar_type IN ('P', '')
					AND f_asuheader.client = 'DF'
					AND f_agltransact.apar_id = f_asuheader.apar_id	
				LEFT OUTER JOIN
					[ProjectDataMart].AgressoSourceData.f_aglrelvalue(@VersionIdInternal, 'N')
				ON
					f_agltransact.apar_type IN ('P', '')
					AND f_aglrelvalue.client = 'DF'
					AND f_aglrelvalue.attribute_id = 'A5'
					AND f_aglrelvalue.rel_attr_id = 'S1'
					AND f_agltransact.apar_id = f_aglrelvalue.att_value
				LEFT OUTER JOIN
					[ProjectDataMart].AgressoSourceData.f_acuheader(@VersionIdInternal, 'N')
				ON
					f_agltransact.apar_type IN ('R', '')
					AND f_acuheader.client = 'DF'
					AND f_agltransact.apar_id = f_acuheader.apar_id	
				LEFT OUTER JOIN
					(SELECT * FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND Status='Open') ExclusionProject
				ON
					[iati-activity].ProjectId = ExclusionProject.ID
				LEFT OUTER JOIN
					(SELECT * FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Component' AND Status='Open') ExclusionComponent
				ON
					[iati-activity].ComponentId = ExclusionComponent.ID
				LEFT OUTER JOIN
					[PublicationControl].ExclusionAccount
				ON
					f_agltransact.account = ExclusionAccount.AccountCode
				LEFT OUTER JOIN
					[PublicationControl].ExclusionVoucherType
				ON
					f_agltransact.voucher_type = ExclusionVoucherType.VoucherTypeCode
				LEFT OUTER JOIN
					[PublicationControl].ExclusionBudgetCentre
				ON
					f_agltransact.dim_1 = ExclusionBudgetCentre.BudgetCentreCode
				LEFT OUTER JOIN
					/* For Blanket Level Supplier Exclusion */
					(SELECT * FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Supplier' AND ExclusionLevel='Blanket' AND Status='Open') ExclusionSupplier
				ON
					f_agltransact.apar_type IN ('', 'P')
					AND f_agltransact.apar_id = ExclusionSupplier.ID
				LEFT OUTER JOIN
					[PublicationControl].SupplierInclusionList
				ON
					f_agltransact.apar_id = SupplierInclusionList.SupplierId
				LEFT OUTER JOIN
					/* For Project Level Supplier Exclusion */
					(SELECT * FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Supplier' AND ExclusionLevel='Project' AND Status='Open') ExclusionSupplierProject
				ON
					[iati-activity].ProjectId = ExclusionSupplierProject.ParentProjectID
					AND f_agltransact.apar_id = ExclusionSupplierProject.ID
				WHERE
					[iati-activity].[iati-activitiesId] = 101
					AND [iati-activity].ComponentId IS NOT NULL
			)
			SELECT
				*,
				CASE WHEN
					IsIncludedAccount = 'Y'
					AND IsProvisionRelated = 'N'
					AND IsProcurementExcluded = 'N'
					AND IsProjectExcluded = 'N'
					AND IsComponentExcluded = 'N'
					AND IsAccountExcluded = 'N'
					AND IsVoucherTypeExcluded = 'N'
					AND IsBudgetCentreExcluded = 'N'
					AND IsBenefittingCountryExcluded = 'N'
					AND IsTransactionExcluded = 'N'
					AND IsDateExcluded = 'N'
					AND IsTransactionLineAmountExcluded = 'N'
				THEN
					'Y'
				ELSE
					'N'
				END AS IsIncluded
			INTO
				[PublicationControl].UnfilteredTransactions
			FROM
				Main
			OPTION
				(RECOMPILE)
			
			/* Publish transactions related to emergency humanitarian aid in [PublicationControl].UnfilteredTransactions*/
			 
			UPDATE [PublicationControl].UnfilteredTransactions
			SET IsIncluded = 'Y'
			WHERE dim_4 IN (SELECT ComponentId 
							FROM [PublicationControl].UnfilteredTransactions Tr
							INNER JOIN
							[PublicationControl].EmergencyAidComponents Eac
							ON 
							Tr.dim_4 = Eac.ComponentId
							Group By ComponentId)	
			
			/* Populate transaction with spend along with [iati-activityID] in [IATISchema].[transaction]*/
						
			EXECUTE [PublicationControl].p_PrintProgress N'Finished populating transaction with spend';

			INSERT INTO [IATISchema].[transaction]
			(
				[iati-activityID]
				,[IsExcluded]
				,[OriginalValue]
				,[@flow]
				,[value/@currency]
				,[value/@value-date]
				,[value/@type]
				,[value/text()]
				,[transaction-type/@xml:lang]
				,[transaction-type/@code]
				,[transaction-type/@type]
				,[transaction-type/text()]
				,[provider-org/@xml:lang]
				,[provider-org/@ref]
				,[provider-org/@type]
				,[provider-org/@provider-activity-id]
				,[provider-org/text()]
				,[receiver-org/@xml:lang]
				,[receiver-org/@ref]
				,[receiver-org/@type]
				,[receiver-org/@receiver-activity-id]
				,[receiver-org/text()]
				,[description/@xml:lang]
				,[description/text()]
				,[transaction-date/@iso-date]
				,[tied-status/@xml:lang]
				,[tied-status/@code]
				,[tied-status/@type]
				,[tied-status/text()]
			)
			SELECT
				UnfilteredTransactions.[iati-activityID] AS [iati-activityID]
				,0 AS [IsExcluded]
				,UnfilteredTransactions.[amount] AS [OriginalValue]
				,NULL AS [@flow]
				,'GBP' AS [value/@currency]
				,UnfilteredTransactions.last_update AS [value/@value-date]
				,NULL AS [value/@type]
				,UnfilteredTransactions.[amount] AS [value/text()]
				,NULL AS [transaction-type/@xml:lang]
				,CASE
				WHEN UnfilteredTransactions.account = '3402' THEN 'LR'
				WHEN UnfilteredTransactions.account = '3403' THEN 'IR'
				WHEN f_ComponentTransformed.FundingTypeCode IN ('PROCUREMENTOFGOODS', 'PROCOFSERVICES') THEN 'E' -- i.e. "Expenditure" entry in TransactionType code list
				ELSE 'D' /* i.e. "Disbursement" entry in TransactionType code list */
				END AS [transaction-type/@code]
				,NULL AS [transaction-type/@type]
				,NULL AS [transaction-type/text()]
				,NULL AS [provider-org/@xml:lang]
				,@DFIDOrganisationIdentifier AS [provider-org/@ref]
				,NULL AS [provider-org/@type]
				,NULL AS [provider-org/@provider-activity-id]
				,NULL AS [provider-org/text()]
				,NULL AS [receiver-org/@xml:lang]
				,UnfilteredTransactions.IATIChannelCode AS [receiver-org/@ref]
				,NULL AS [receiver-org/@type]
				,NULL AS [receiver-org/@receiver-activity-id]
				,UnfilteredTransactions.IATICustomerSupplier AS [receiver-org/text()]
				,NULL AS [description/@xml:lang]
				,IATIAccountName AS [description/text()]
				,UnfilteredTransactions.last_update AS [transaction-date/@iso-date]
				/* all DFID aid is untied, which we pick up from the activity */
				,NULL AS [tied-status/@xml:lang]
				,NULL AS [tied-status/@code]
				,NULL AS [tied-status/@type]
				,NULL AS [tied-status/text()]
			FROM
				[PublicationControl].UnfilteredTransactions
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				UnfilteredTransactions.dim_4 = f_ComponentTransformed.ComponentId
			WHERE
				UnfilteredTransactions.IsIncluded = 'Y'

			/* Populate aggregated transactions (Expenditure Items) Before 12th May 2010 along with [iati-activityID] in [IATISchema].[transaction]*/

			EXECUTE [PublicationControl].p_PrintProgress N'Populating aggregated transactions (Expenditure Items) pre 12th May 2010'
			
			INSERT INTO [IATISchema].[transaction]
			(	
				[iati-activityID]
				,[IsExcluded]
				,[OriginalValue]
				,[@flow]
				,[value/@currency]
				,[value/@value-date]
				,[value/@type]
				,[value/text()]
				,[transaction-type/@xml:lang]
				,[transaction-type/@code]
				,[transaction-type/@type]
				,[transaction-type/text()]
				,[provider-org/@xml:lang]
				,[provider-org/@ref]
				,[provider-org/@type]
				,[provider-org/@provider-activity-id]
				,[provider-org/text()]
				,[receiver-org/@xml:lang]
				,[receiver-org/@ref]
				,[receiver-org/@type]
				,[receiver-org/@receiver-activity-id]
				,[receiver-org/text()]
				,[description/@xml:lang]
				,[description/text()]
				,[transaction-date/@iso-date]
				,[tied-status/@xml:lang]
				,[tied-status/@code]
				,[tied-status/@type]
				,[tied-status/text()]
			)
			SELECT
				UnfilteredTransactions.[iati-activityID] AS [iati-activityID]
				,0 AS [IsExcluded]
				,SUM(UnfilteredTransactions.[amount]) AS [OriginalValue]
				,NULL AS [@flow]
				,'GBP' AS [value/@currency]
				,CASE 
					WHEN UnfilteredTransactions.fiscal_year = '2010' THEN Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year), 5, 11)
					WHEN PublicationControl.f_QuarterValue(voucher_date) = 1 THEN Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year),6, 30)
					WHEN PublicationControl.f_QuarterValue(voucher_date) = 2 THEN Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year),9, 30)
					WHEN PublicationControl.f_QuarterValue(voucher_date) = 3 THEN Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year),12, 31)
					ELSE Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year)+1,3, 31)
				 END
				 AS [value/@value-date]
				,NULL AS [value/@type]
				,SUM(UnfilteredTransactions.[amount]) AS [value/text()]
				,NULL AS [transaction-type/@xml:lang]
				,'E' as [transaction-type/@code]
				,NULL AS [transaction-type/@type]
				,NULL AS [transaction-type/text()]
				,NULL AS [provider-org/@xml:lang]
				,@DFIDOrganisationIdentifier AS [provider-org/@ref] 
				,NULL AS [provider-org/@type]
				,NULL AS [provider-org/@provider-activity-id]
				,NULL AS [provider-org/text()]
				,NULL AS [receiver-org/@xml:lang]
				,NULL AS [receiver-org/@ref]
				,NULL AS [receiver-org/@type]
				,NULL AS [receiver-org/@receiver-activity-id]
				,NULL [receiver-org/text()]
				,NULL AS [description/@xml:lang]
				,CASE 
					WHEN UnfilteredTransactions.fiscal_year = '2010' THEN 'Aggregated spend data - Financial Year 2010 Quarter 1 (prior to 12th May 2010)'
					ELSE 'Aggregated spend data - Financial Year ' + CONVERT(nvarchar,(Max(UnfilteredTransactions.fiscal_year))) + ' Quarter ' + CONVERT(nvarchar,(Max(PublicationControl.f_QuarterValue(voucher_date))))
				 END
				AS [description/text()]
				,CASE 
					WHEN UnfilteredTransactions.fiscal_year = '2010' THEN Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year), 5, 11)
					WHEN PublicationControl.f_QuarterValue(voucher_date) = 1 THEN Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year),6, 30)
					WHEN PublicationControl.f_QuarterValue(voucher_date) = 2 THEN Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year),9, 30)
					WHEN PublicationControl.f_QuarterValue(voucher_date) = 3 THEN Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year),12, 31)
					ELSE Configuration.f_MakeDate(Max(UnfilteredTransactions.fiscal_year)+1,3, 31)
				 END
				 AS [transaction-date/@iso-date]
				,NULL AS [tied-status/@xml:lang]
				,NULL AS [tied-status/@code]
				,NULL AS [tied-status/@type]
				,NULL AS [tied-status/text()]		
			FROM
				[PublicationControl].UnfilteredTransactions
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				UnfilteredTransactions.dim_4 = f_ComponentTransformed.ComponentId
			WHERE
				UnfilteredTransactions.last_update < '2010-05-12 00:00:00'
				and UnfilteredTransactions.IsIncludedAccount = 'Y'
				and UnfilteredTransactions.IsProvisionRelated = 'N'
				and UnfilteredTransactions.IsProcurementExcluded = 'N'
				and UnfilteredTransactions.IsProjectExcluded = 'N'
				and UnfilteredTransactions.IsComponentExcluded = 'N'
				and UnfilteredTransactions.IsAccountExcluded = 'N'
				and UnfilteredTransactions.IsVoucherTypeExcluded = 'N' 
				and UnfilteredTransactions.IsBudgetCentreExcluded = 'N'
				and UnfilteredTransactions.IsBenefittingCountryExcluded = 'N'
				and UnfilteredTransactions.IsTransactionExcluded = 'N'
			Group By
				UnfilteredTransactions.[iati-activityID], UnfilteredTransactions.fiscal_year, PublicationControl.f_QuarterValue(voucher_date)
		
			
			/* Populate aggregated transactions with a value less than £500 along with [iati-activityID] in [IATISchema].[transaction]*/
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating quarterly aggregated transactions (Expenditure Items) for values less than £500'
			
			INSERT INTO [IATISchema].[transaction]
			(	
				[iati-activityID]
				,[IsExcluded]
				,[OriginalValue]
				,[@flow]
				,[value/@currency]
				,[value/@value-date]
				,[value/@type]
				,[value/text()]
				,[transaction-type/@xml:lang]
				,[transaction-type/@code]
				,[transaction-type/@type]
				,[transaction-type/text()]
				,[provider-org/@xml:lang]
				,[provider-org/@ref]
				,[provider-org/@type]
				,[provider-org/@provider-activity-id]
				,[provider-org/text()]
				,[receiver-org/@xml:lang]
				,[receiver-org/@ref]
				,[receiver-org/@type]
				,[receiver-org/@receiver-activity-id]
				,[receiver-org/text()]
				,[description/@xml:lang]
				,[description/text()]
				,[transaction-date/@iso-date]
				,[tied-status/@xml:lang]
				,[tied-status/@code]
				,[tied-status/@type]
				,[tied-status/text()]
			)
			SELECT
				LT500.[iati-activityID] AS [iati-activityID]
				,0 AS [IsExcluded]
				,SUM(LT500.[amount]) AS [OriginalValue] --Sum this
				,NULL AS [@flow]
				,'GBP' AS [value/@currency]
				,CASE 
					WHEN PublicationControl.f_QuarterValue(LT500.voucher_date) = 1 THEN Configuration.f_MakeDate(Max(LT500.fiscal_year),6, 30)
					WHEN PublicationControl.f_QuarterValue(LT500.voucher_date) = 2 THEN Configuration.f_MakeDate(Max(LT500.fiscal_year),9, 30)
					WHEN PublicationControl.f_QuarterValue(LT500.voucher_date) = 3 THEN Configuration.f_MakeDate(Max(LT500.fiscal_year),12, 31)
					ELSE Configuration.f_MakeDate(Max(LT500.fiscal_year)+1,3, 31)
				 END
				 AS [value/@value-date]
				,NULL AS [value/@type]
				,SUM(LT500.[amount]) AS [value/text()]
				,NULL AS [transaction-type/@xml:lang]
				,'E' as [transaction-type/@code]
				,NULL AS [transaction-type/@type]
				,NULL AS [transaction-type/text()]
				,NULL AS [provider-org/@xml:lang]
				,@DFIDOrganisationIdentifier AS [provider-org/@ref]
				,NULL AS [provider-org/@type] 
				,NULL AS [provider-org/@provider-activity-id]
				,NULL AS [provider-org/text()]
				,NULL AS [receiver-org/@xml:lang]
				,NULL AS [receiver-org/@ref]
				,NULL AS [receiver-org/@type]
				,NULL AS [receiver-org/@receiver-activity-id]
				,NULL [receiver-org/text()]
				,NULL AS [description/@xml:lang]
				,'Aggregated spend of less than £500 - Financial Year ' + CONVERT(nvarchar,(Max(LT500.fiscal_year))) + ' Quarter ' + CONVERT(nvarchar,(Max(PublicationControl.f_QuarterValue(voucher_date))))
				  AS [description/text()]
				,CASE 
					WHEN PublicationControl.f_QuarterValue(LT500.voucher_date) = 1 THEN Configuration.f_MakeDate(Max(LT500.fiscal_year),6, 30)
					WHEN PublicationControl.f_QuarterValue(LT500.voucher_date) = 2 THEN Configuration.f_MakeDate(Max(LT500.fiscal_year),9, 30)
					WHEN PublicationControl.f_QuarterValue(LT500.voucher_date) = 3 THEN Configuration.f_MakeDate(Max(LT500.fiscal_year),12, 31)
					ELSE Configuration.f_MakeDate(Max(LT500.fiscal_year)+1,3, 31)
				 END
				 AS [transaction-date/@iso-date]
				,NULL AS [tied-status/@xml:lang]
				,NULL AS [tied-status/@code]
				,NULL AS [tied-status/@type]
				,NULL AS [tied-status/text()]
			FROM
			(Select *  
			 From [PublicationControl].UnfilteredTransactions
			 Where IsIncludedAccount = 'Y'
				  AND IsProvisionRelated = 'N'
				  AND IsProcurementExcluded = 'N'
				  AND IsProjectExcluded = 'N'
				  AND IsComponentExcluded = 'N'
				  AND IsAccountExcluded = 'N'
				  AND IsVoucherTypeExcluded = 'N'
				  AND IsBudgetCentreExcluded = 'N'
				  AND IsBenefittingCountryExcluded = 'N'
				  AND IsTransactionExcluded = 'N'
				  AND IsDateExcluded = 'N'
				  AND IsTransactionLineAmountExcluded = 'Y'
				  AND IsIncluded = 'N') As LT500
			GROUP BY LT500.[iati-activityID], LT500.fiscal_year, PublicationControl.f_QuarterValue(LT500.voucher_date)
		
	
	
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating conditions for all projects'
	
			/* Delete All data from [IATISchema].[conditions] */ 
			DELETE FROM [IATISchema].[conditions] 
		
			/* Populate conditions info for all Projects along with [iati-activityID] in [IATISchema].conditions */
			INSERT INTO [IATISchema].conditions 
			(
				[iati-activityID]
				,[@attached]
				,[condtionFlag]
			)
			SELECT
				[iati-activityID]
				,CASE
					WHEN [PublicationControl].[f_HasSpecificConditions](ProjectId) = 1 THEN 1
					WHEN [PublicationControl].[f_HasBudgetSupport](ProjectId) = 1 THEN 1		
					ELSE 0
				END AS [@attached]
				,CASE
					WHEN [PublicationControl].[f_HasSpecificConditions](ProjectId) = 1 AND [PublicationControl].[f_HasBudgetSupport](ProjectId) = 1 THEN 'C'
					WHEN [PublicationControl].[f_HasSpecificConditions](ProjectId) = 1 THEN 'S'
					WHEN [PublicationControl].[f_HasBudgetSupport](ProjectId) = 1 THEN 'G'
					ELSE NULL
				END AS [condtionFlag]
			FROM
				[IATISchema].[iati-activity] 
			WHERE [@hierarchy] = 1

			/* Populate condition detials info for all Projects along with [iati-activityID] in [IATISchema].[conditions/condition] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating conditions/condition for all projects with conditions'

			INSERT INTO [IATISchema].[conditions/condition] 
			(
				[conditionsID] 
				,[@type] 
				,[text()] 
			)
			SELECT
				[conditionsID]
				,1 as [@type]
				,'Yes - General Conditions - For all financial aid that the UK provides direct to partner governments, the four Partnership Principles apply.' AS [text()]
			FROM
				[IATISchema].conditions c
			inner join [IATISchema].[iati-activity] a
			on a.[iati-activityID] = c.[iati-activityID]
			where c.[@attached] = 1	AND c.[condtionFlag] IS NOT NULL AND  c.[condtionFlag] = 'G'

			UNION ALL

			SELECT
				[conditionsID]
				,1 as [@type]
				,'Yes - Specific Conditions - Details on specific conditions can be found in the Business Case for individual projects.' AS [text()]
			FROM 
				[IATISchema].conditions c
			inner join [IATISchema].[iati-activity] a
			on a.[iati-activityID] = c.[iati-activityID]
			where c.[@attached] = 1	AND c.[condtionFlag] IS NOT NULL AND  c.[condtionFlag] = 'S'

			UNION ALL

			SELECT
				[conditionsID]
				,1 as [@type]
				,'Yes - General Conditions - For all financial aid that the UK provides direct to partner governments, the four Partnership Principles apply.' AS [text()]
			FROM
				[IATISchema].conditions c
			inner join [IATISchema].[iati-activity] a
			on a.[iati-activityID] = c.[iati-activityID]
			where c.[@attached] = 1	AND c.[condtionFlag] IS NOT NULL AND  c.[condtionFlag] = 'C'

			UNION ALL

			SELECT
				[conditionsID]
				,1 as [@type]
				,'Yes - Specific Conditions - Details on specific conditions can be found in the Business Case for individual projects.' AS [text()]
			FROM 
				[IATISchema].conditions c
			inner join [IATISchema].[iati-activity] a
			on a.[iati-activityID] = c.[iati-activityID]
			where c.[@attached] = 1	AND c.[condtionFlag] IS NOT NULL AND  c.[condtionFlag] = 'C'
		
			
			
			
			/* Populate capital spend all Components along with [iati-activityID] in [IATISchema].[capital-spend]  */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating capital spend for all components'
			
			INSERT INTO [IATISchema].[capital-spend] 
			(
				[iati-activityID] 
				,[@percentage] 
			)
			SELECT
				[iati-activityID]
				,CASE
					WHEN b.SpendTypeCode in ('C', 'PC', 'CAME') THEN 100
					ELSE 0
				END AS [@percentage]
			FROM [ProjectDataMart].AgressoTransformation.v_ComponentTransformedCurrent c
			inner join [ProjectDataMart].AgressoTransformation.v_BudgetCentreTransformedCurrent b
			on c.BudgetCentreCode = b.BudgetCentreCode
			inner join [IATISchema].[iati-activity] a
			on a.[ComponentId] = c.[ComponentId]
			
			
			
			/* Populate budget-item along with [iati-activityID] in [IATISchema].[country-budget-items/budget-item] */
			INSERT INTO [IATISchema].[country-budget-items/budget-item] 
			(
				[iati-activityID]
				,[@code] 
				,[@percentage]
				,[text()]
			)
			SELECT  IATISchema.[iati-activity].[iati-activityID]
					,Mapping.[Code]
					,CASE 
						WHEN IATISchema.sector.[@percentage] IS NULL THEN 100
						ELSE IATISchema.sector.[@percentage]
					END AS [@percentage]
					,Mapping.BudgetSector + ' - ' + Mapping.Category + ' - ' + Mapping.[Function] as [text()]
			FROM    IATISchema.sector
			CROSS APPLY
					(
					SELECT  TOP 1 
						PublicationControl.MappingRecipientCountryBudgetIdentifier.[Code],
						PublicationControl.MappingRecipientCountryBudgetIdentifier.[Sector],
						Codelist.[v_RecipientCountryBudgetIdentifier].[Function],
						Codelist.[v_RecipientCountryBudgetIdentifier].BudgetSector,
						Codelist.[v_RecipientCountryBudgetIdentifier].Category
					FROM  PublicationControl.MappingRecipientCountryBudgetIdentifier
					LEFT OUTER JOIN
					[Codelist].[v_RecipientCountryBudgetIdentifier]
					on Codelist.[v_RecipientCountryBudgetIdentifier].[Code] = PublicationControl.MappingRecipientCountryBudgetIdentifier.[Code]
					WHERE   PublicationControl.MappingRecipientCountryBudgetIdentifier.[Sector] = [IATISchema].Sector.[@code]
					) Mapping
			INNER JOIN
				IATISchema.[iati-activity]
				on IATISchema.[iati-activity].[iati-activityID] = IATISchema.sector.[iati-activityID]	


			/* Populate Country budget items along with [iati-activityID] in [IATISchema].[country-budget-items]  */
			/** only insert the wrapper where there are child budget items to wrap **/
			
			INSERT INTO [IATISchema].[country-budget-items] 
			(
				[iati-activityID]
				,[@vocabulary] 
			)
			SELECT DISTINCT
				[IATISchema].[country-budget-items/budget-item].[iati-activityID]
				,'1' --IATI vocabulary
			FROM [IATISchema].[country-budget-items/budget-item]

	
			/* Populate related-activity with parent projects for all components along with [iati-activityID] in [IATISchema].[related-activity] */

			EXECUTE [PublicationControl].p_PrintProgress N'Populating related-activity with parent projects for all components'

			INSERT INTO
				[IATISchema].[related-activity]
			(
				[iati-activityID]	
				,[@xml:lang]			
				,[@ref]				
				,[@type]
				,[text()]				
			)
			SELECT
				ComponentActivityMapping.[iati-activityID] AS [iati-activityID]	
				,NULL AS [@xml:lang]			
				,@DFIDOrganisationIdentifier + '-' + ComponentActivityMapping.ProjectId AS [@ref]				
				,1 AS [@type]
				,f_ProjectTransformed.ProjectTitle AS [text()]
			FROM
				@ComponentActivityMapping ComponentActivityMapping
			LEFT OUTER JOIN
				[ProjectDataMart].AgressoTransformation.f_ProjectTransformed(@VersionIdInternal, 'N')
			ON
				ComponentActivityMapping.ProjectId = f_ProjectTransformed.ProjectId
			
			/* Populate related-activity with child components for all projects along with [iati-activityID] in [IATISchema].[related-activity] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating related-activity with child components for all projects'

			INSERT INTO
				[IATISchema].[related-activity]
			(
				[iati-activityID]	
				,[@xml:lang]			
				,[@ref]				
				,[@type]
				,[text()]				
			)
			SELECT
				ProjectActivityMapping.[iati-activityID] AS [iati-activityID]	
				,NULL AS [@xml:lang]			
				,@DFIDOrganisationIdentifier + '-' + ComponentActivityMapping.ComponentId AS [@ref]				
				,2 AS [@type]
				,f_ComponentTransformed.ComponentTitle AS [text()]
			FROM
				@ProjectActivityMapping ProjectActivityMapping
			INNER JOIN
				@ComponentActivityMapping ComponentActivityMapping
			ON
				ProjectActivityMapping.ProjectId = ComponentActivityMapping.ProjectId
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				ComponentActivityMapping.ComponentId = f_ComponentTransformed.ComponentId
			
			/* Populate related-activity with sibling components for all components along with [iati-activityID] in [IATISchema].[related-activity] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating related-activity with sibling components for all components'

			INSERT INTO
				[IATISchema].[related-activity]
			(
				[iati-activityID]	
				,[@xml:lang]			
				,[@ref]				
				,[@type]
				,[text()]				
			)
			SELECT
				component.[iati-activityID] AS [iati-activityID]	
				,NULL AS [@xml:lang]			
				,@DFIDOrganisationIdentifier + '-' + f_ComponentTransformed.ComponentId AS [@ref]				
				,3 AS [@type]
				,f_ComponentTransformed.ComponentTitle AS [text()]
			FROM
				@ComponentActivityMapping component
			INNER JOIN
				@ComponentActivityMapping sibling_component
			ON
				component.ProjectId = sibling_component.ProjectId
				AND component.ComponentId != sibling_component.ComponentId
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentTransformed(@VersionIdInternal, 'N')
			ON
				sibling_component.ComponentId = f_ComponentTransformed.ComponentId

			/* Populate document url for Publishable documents along with [iati-activityID] in [IATISchema].[iati-activity/document-link] */

			EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link'
	
			INSERT INTO [IATISchema].[iati-activity/document-link]
			(
				[iati-activityID]
				,[QuestID]
				,[@url]
				,[@format]
				,[@language]
				,[@LastUpdated-Month-Year]
			)
			SELECT 
			   ProjectActivityMapping.[iati-activityID] AS [iati-activityID],
			   publishedDocs.QuestID AS [QuestID], 
			   @DocumentURIPrefix 
			   + replace(publishedDocs.QuestID,' ','') 
			   + CASE
				     WHEN
						 UPPER(reverse(left(reverse(docProjPage.OriginalFileName),charindex('.',reverse(docProjPage.OriginalFileName))))) ='.DOC'
					 THEN	
				         '.odt'
				     WHEN
						UPPER(reverse(left(reverse(docProjPage.OriginalFileName),charindex('.',reverse(docProjPage.OriginalFileName))))) ='.DOCX'    
					 THEN
						 '.odt'	
				     ELSE
				        (reverse(left(reverse(docProjPage.OriginalFileName),charindex('.',reverse(docProjPage.OriginalFileName))))) 
				     END
			   as [@url],
			   CASE
				     WHEN
						 UPPER(reverse(left(reverse(docProjPage.OriginalFileName),charindex('.',reverse(docProjPage.OriginalFileName))))) ='.DOC'
					 THEN	
				         'application/vnd.oasis.opendocument.text'
				     WHEN
						UPPER(reverse(left(reverse(docProjPage.OriginalFileName),charindex('.',reverse(docProjPage.OriginalFileName))))) ='.DOCX'    
					 THEN
						 'application/vnd.oasis.opendocument.text'	
				     ELSE
				        docProjPage.MimeType
				     END
			   AS [@format],
			   CASE
				WHEN ISNULL(questLanguage.IATILanguageCode, '') = '' THEN NULL
				WHEN questLanguage.IATILanguageCode = 'en' THEN NULL			
				ELSE questLanguage.IATILanguageCode
			   END AS [@language],
			   DATENAME(MONTH, pdc.LastUpdatedDate) + ', ' + DATENAME(YEAR, pdc.LastUpdatedDate) AS [@LastUpdated-Month-Year]
			  FROM [PublicationControl].PublishedDocuments publishedDocs
			  INNER JOIN
			  (Select pdpc.ProjectID, DocumentID 
				From [ProjectDatamart].[EDRMSourceData].v_ProjectDocumentProjectCurrent pdpc
				Group By pdpc.ProjectID, DocumentID) docProjLink 
		      ON
			  (publishedDocs.QuestID = docProjLink.DocumentID AND publishedDocs.ProjectID=docProjLink.ProjectID)
			  INNER JOIN
			  [ProjectDatamart].[EDRMSourceData].v_ProjectDocumentPageCurrent docProjPage
			  ON 
			  publishedDocs.QuestID = docProjPage.DocumentID
			  INNER JOIN
			  [ProjectDatamart].[EDRMSourceData].v_ProjectDocumentTypeCurrent docProjType
			  ON 
			  publishedDocs.QuestID = docProjType.DocumentID
			  INNER JOIN
			  [ProjectDatamart].[EDRMSourceData].v_ProjectDocumentCurrent pdc
			  ON 
			  publishedDocs.QuestID = pdc.DocumentID
			  LEFT OUTER JOIN
			  [PublicationControl].[MappingQuestLanguage] questLanguage
			  ON 
			  docProjType.[Language] = questLanguage.QuestLanguage
			  INNER JOIN
			  @ProjectActivityMapping ProjectActivityMapping
			  ON
			  docProjLink.ProjectID = ProjectActivityMapping.ProjectId
			  WHERE publishedDocs.PublicationStatusID<>6				
			
			/* Populate title for Publishable documents along with [document-linkID] in [IATISchema].[iati-activity/document-link/title] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link/title'
	
			INSERT INTO [IATISchema].[iati-activity/document-link/title]
			(
				[document-linkID]
				,[@xml:lang]
				,[text()]
			)
			SELECT 
				   docLink.[iati-activity/document-linkID] AS [document-linkID],
				   docLink.[@language] AS [@language],
				   ISNULL(projDocType.Content_Type, '<Unknown Title>') 
				   + ' ' +
				   CASE
				   WHEN
						COUNT(*) OVER (PARTITION BY activity.ProjectID, projDocType.Content_Type) != 1
				   THEN
						'(' + CONVERT(VARCHAR(MAX), ROW_NUMBER() OVER (PARTITION BY activity.ProjectID, projDocType.Content_Type ORDER BY docLink.QuestID)) + ') '
				   ELSE
						''
				   END
				   + replace(activity.ProjectID,' ','')
				   + CASE
				     WHEN
						 docLink.[@LastUpdated-Month-Year] IS NOT NULL
					 THEN	
				         ' (' + docLink.[@LastUpdated-Month-Year] + ')'
				     ELSE
				         ''
				     END
				   + (reverse(left(reverse(docLink.[@url]),charindex('.',reverse(docLink.[@url])))))
				   AS [text()]
			FROM [IATISchema].[iati-activity/document-link] docLink
				 INNER JOIN
				 [ProjectDatamart].[EDRMSourceData].[v_ProjectDocumentTypeCurrent] projDocType
				 ON 
				 docLink.QuestID = projDocType.DocumentID
				 INNER JOIN
				 [IATISchema].[iati-activity] activity
				 ON
				 activity.[iati-activityID] = docLink.[iati-activityID]

	
			/* Populate Category for Publishable documents along with [document-linkID] in [IATISchema].[iati-activity/document-link/category] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link/category'
	
			INSERT INTO [IATISchema].[iati-activity/document-link/category]
			(
				[document-linkID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[text()]
			)
			SELECT
				docLink.[iati-activity/document-linkID] AS [document-linkID],
				docLink.[@language] AS [@xml:lang],
				questContentType.IATIContentTypeCode AS [@code],
				NULL AS [@type]
				,docContentType.Name AS [text()]
			FROM
				[IATISchema].[iati-activity/document-link] docLink
			INNER JOIN
				 [ProjectDatamart].[EDRMSourceData].[v_ProjectDocumentTypeCurrent] projDocType
				 ON 
				 docLink.QuestID = projDocType.DocumentID
			INNER JOIN
				 [PublicationControl].MappingQuestContentType questContentType	 
				 ON 
				 questContentType.QuestContentType = projDocType.Content_Type	
			INNER JOIN [Codelist].[DocumentCategory] docContentType
				 ON
				 questContentType.IATIContentTypeCode = docContentType.Code		
	
	/* Populate document url for Legacy documents along with [iati-activityID] in [IATISchema].[iati-activity/document-link] */
	
	EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link with legacy document data'
	
		INSERT INTO [IATISchema].[iati-activity/document-link]
		(
			[iati-activityID]
			,[QuestID]
			,[@url]
			,[@format]
			,[@language]
		)
		SELECT
			ia.[iati-activityID] AS [iati-activityID],
			ld.QuestID AS [QuestID],
			@DocumentURIPrefix + '/' + replace(ld.QuestID,' ','') + replace(ld.DocumentExtension,' ','') as [@url],
			ld.Format AS [@format],
			NULL AS [@language]
		FROM 
			[PublicationControl].LegacyDocuments ld
			INNER JOIN
			[IATISchema].[iati-activity] ia
			ON
			ld.ProjectNumber = ia.ProjectId
		Where ia.ComponentId IS NULL 		
		
		/* Populate title for Legacy documents along with [document-linkID] in [IATISchema].[iati-activity/document-link/title] */
		
		EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link/title with legacy documents'
		
		INSERT INTO [IATISchema].[iati-activity/document-link/title]
		(
			[document-linkID]
			,[@xml:lang]
			,[text()]
		)
		SELECT
			[iati-activity/document-link].[iati-activity/document-linkID] AS [document-linkID]
			,[iati-activity/document-link].[@language] AS [@language]
			,replace(ld.[Type],' ','')+' '+replace(ld.[ProjectNumber],' ','')+replace(ld.[DocumentExtension],' ','') AS [text()]
		FROM
			[IATISchema].[iati-activity/document-link]
		INNER JOIN
			[PublicationControl].[LegacyDocuments] ld
		ON
			[iati-activity/document-link].QuestID = ld.QuestID

		
		/* Populate Category for Legacy documents along with [document-linkID] in [IATISchema].[iati-activity/document-link/category] */
		
		EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link/category with legacy documents'

		INSERT INTO [IATISchema].[iati-activity/document-link/category]
		(
			[document-linkID]
			,[@xml:lang]
			,[@code]
			,[@type]
			,[text()]
		)
		SELECT
			[iati-activity/document-link].[iati-activity/document-linkID] AS [document-linkID]
			,[iati-activity/document-link].[@language] AS [@xml:lang]
			,ld.IatiCode AS [@code]
			,NULL AS [@type]
			,ld.IatiTextDesc AS [text()]
		FROM
			[IATISchema].[iati-activity/document-link]
		INNER JOIN
			[PublicationControl].[LegacyDocuments] ld
		ON
			[iati-activity/document-link].QuestID = ld.QuestID	
				 

	
	/* Populate document url for contracts and tenders documents from ContractsFinder along with [iati-activityID] in [IATISchema].[iati-activity/document-link] */
	
	EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link with contracts and tenders from ContractsFinder'

			INSERT INTO [IATISchema].[iati-activity/document-link]
			(
				[iati-activityID]
				,[QuestID]
				,[@url]
				,[@format]
				,[@language]
			)
			SELECT
				IATISchema.[iati-activity].[iati-activityID] AS [iati-activityID]
				,'CF' + CONVERT(varchar(10),[PublicationControl].ContractsFinderContracts.ContractId) AS QuestID
				,[PublicationControl].ContractsFinderContracts.ContractUrl 
				,'text/html' AS [@format]
				,NULL AS [@language]
			FROM
				[PublicationControl].ContractsFinderContracts
			INNER JOIN [ProjectDataMart].AgressoSourceData.apoheader
				on [ProjectDataMart].AgressoSourceData.apoheader.order_id = [PublicationControl].ContractsFinderContracts.PurchaseOrder
			INNER JOIN
				IATISchema.[iati-activity]
			ON
				substring([ProjectDataMart].AgressoSourceData.apoheader.dim_value_4,0,7) = IATISchema.[iati-activity].ProjectId
			WHERE
				[ProjectDataMart].AgressoSourceData.apoheader.ToVersionId is NULL
				and IATISchema.[iati-activity].[@hierarchy] = 1				
	
			
			/* Populate title for contracts and tenders documents from ContractsFinder along with [document-linkID] in [IATISchema].[iati-activity/document-link/title] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link/title with contracts and tenders from ContractsFinder'
	
			INSERT INTO [IATISchema].[iati-activity/document-link/title]
			(
				[document-linkID]
				,[@xml:lang]
				,[text()]
			)
			SELECT
				[iati-activity/document-link].[iati-activity/document-linkID] AS [document-linkID]
				,[iati-activity/document-link].[@language] AS [@language]
				,CASE
					WHEN [PublicationControl].ContractsFinderContracts.DocumentCategoryCode = 'A10' THEN 'Tender: ' + [PublicationControl].ContractsFinderContracts.ContractTitle 
					WHEN [PublicationControl].ContractsFinderContracts.DocumentCategoryCode = 'A11' THEN 'Contract: ' + [PublicationControl].ContractsFinderContracts.ContractTitle 
					ELSE [PublicationControl].ContractsFinderContracts.ContractTitle 
				END AS [text()]
			FROM
				[IATISchema].[iati-activity/document-link]
			INNER JOIN
				[PublicationControl].ContractsFinderContracts
			ON
				[iati-activity/document-link].QuestID = 'CF' + CONVERT(varchar(10),[PublicationControl].ContractsFinderContracts.ContractId)
			
			/* Populate Category for contracts and tenders documents from ContractsFinder along with [document-linkID] in [IATISchema].[iati-activity/document-link/category] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link/category with contracts and tenders from ContractsFinder'
	
			INSERT INTO [IATISchema].[iati-activity/document-link/category]
			(
				[document-linkID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[text()]
			)
			SELECT
				[iati-activity/document-link].[iati-activity/document-linkID] AS [document-linkID]
				,[iati-activity/document-link].[@language] AS [@xml:lang]
				,[PublicationControl].ContractsFinderContracts.DocumentCategoryCode AS [@code]
				,NULL AS [@type]
				,DocumentCategory.Name AS [text()]
			FROM
				[IATISchema].[iati-activity/document-link]
			INNER JOIN
				[PublicationControl].ContractsFinderContracts
			ON
				[iati-activity/document-link].QuestID = 'CF' + CONVERT(varchar(10),[PublicationControl].ContractsFinderContracts.ContractId)
			INNER JOIN
				[Codelist].[DocumentCategory]
			ON
				[PublicationControl].ContractsFinderContracts.DocumentCategoryCode = [Codelist].[DocumentCategory].Code
			
			/* Populate document url for general conditions documents along with [iati-activityID] in [IATISchema].[iati-activity/document-link] */

			EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link with general conditions'
			
			INSERT INTO [IATISchema].[iati-activity/document-link]
			(
				[iati-activityID]
				,[QuestID]
				,[@url]
				,[@format]
				,[@language]
			)
			SELECT
				c.[iati-activityID] AS [iati-activityID]
				,NULL AS QuestID
				,'https://www.gov.uk/government/publications/partnerships-for-poverty-reduction-rethinking-conditionality' AS [@url]
				,'text/html' AS [@format]
				,NULL AS [@language]
			FROM
				[IATISchema].conditions c		
			INNER JOIN
				IATISchema.[iati-activity] a
			on a.[iati-activityID] = c.[iati-activityID]
			where c.[@attached] = 1	AND c.[condtionFlag] IS NOT NULL AND  c.[condtionFlag] = 'G'

			UNION ALL

			SELECT
				c.[iati-activityID] AS [iati-activityID]
				,NULL AS QuestID
				,'https://www.gov.uk/government/publications/partnerships-for-poverty-reduction-rethinking-conditionality' AS [@url]
				,'text/html' AS [@format]
				,NULL AS [@language]
			FROM
				[IATISchema].conditions c		
			INNER JOIN
				IATISchema.[iati-activity] a
			on a.[iati-activityID] = c.[iati-activityID]
			where c.[@attached] = 1	AND c.[condtionFlag] IS NOT NULL AND  c.[condtionFlag] = 'C'

			/* Populate title for general conditions documents along with [document-linkID] in [IATISchema].[iati-activity/document-link/title] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link/title with general conditions'
	
			INSERT INTO [IATISchema].[iati-activity/document-link/title]
			(
				[document-linkID]
				,[@xml:lang]
				,[text()]
			) 
			SELECT
				dl.[iati-activity/document-linkID] AS [document-linkID]
				,dl.[@language] AS [@language]
				,'General Conditions - For all financial aid that the UK provides direct to partner governments, the four Partnership Principles apply.' AS [text()]
			FROM
				[IATISchema].[iati-activity/document-link] dl
			WHERE dl.[iati-activity/document-linkID] IN 
			(
				SELECT [iati-activity/document-linkID] 
				FROM [IATISchema].[iati-activity/document-link]
				WHERE [@url] = 'https://www.gov.uk/government/publications/partnerships-for-poverty-reduction-rethinking-conditionality'
				AND [@format] = 'text/html'

			)

			/* Populate Category for general conditions documents along with [document-linkID] in [IATISchema].[iati-activity/document-link/category] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link/category with general condtions'

			INSERT INTO [IATISchema].[iati-activity/document-link/category]
			(
				[document-linkID]
				,[@xml:lang]
				,[@code]
				,[@type]
				,[text()]
			)
			SELECT
					dl.[iati-activity/document-linkID] AS [document-linkID]
					,dl.[@language] AS [@xml:lang]
					,'A04' AS [@code]
					,NULL AS [@type]
					,DocumentCategory.Name AS [text()]
			FROM
				[IATISchema].[iati-activity/document-link] dl
			INNER JOIN
				[Codelist].[DocumentCategory]
			ON
				[Codelist].[DocumentCategory].Code = 'A04'
			WHERE dl.[iati-activity/document-linkID] IN 
			(
				SELECT [iati-activity/document-linkID] 
				FROM [IATISchema].[iati-activity/document-link]
				WHERE [@url] = 'https://www.gov.uk/government/publications/partnerships-for-poverty-reduction-rethinking-conditionality'
				AND [@format] = 'text/html'
			)

			/* Populate language element for all documents including contracts and tenders along with [document-linkID] in [iati-activity/document-link/language] */
			
			EXECUTE [PublicationControl].p_PrintProgress N'Populating document-link/language for core documents and contracts/tenders'
		
			INSERT INTO [IATISchema].[iati-activity/document-link/language]
			(
				[document-linkID]
				,[@code]
				,[@xml:lang]
				,[text()]
			)
			SELECT
				[iati-activity/document-link].[iati-activity/document-linkID] AS [document-linkID]
				,
				CASE
				WHEN ISNULL([iati-activity/document-link].[@language], '') = '' THEN 'en'
				ELSE [iati-activity/document-link].[@language]
				END AS [@code]
				,null as [@xml:lang]
				,
				CASE
				WHEN ISNULL([iati-activity/document-link].[@language], '') = '' THEN 'English'
				ELSE [Codelist].[Language].Name
				END AS [text()]
			FROM
				[IATISchema].[iati-activity/document-link]
			LEFT OUTER JOIN
				[Codelist].[Language]
			ON
				[Codelist].[Language].Code = [iati-activity/document-link].[@language]
	
	

			/* Populate legacy-data with DFID input sectors along with [iati-activityID] in [legacy-data] */

			EXECUTE [PublicationControl].p_PrintProgress N'Populating legacy-data with DFID input sectors'

			INSERT INTO [IATISchema].[legacy-data]
			(
				[iati-activityID]
				,[@name]
				,[@value]
				,[@iati-equivalent]
				,[text()]
			)
			SELECT
				ComponentActivityMapping.[iati-activityID] AS [iati-activityID]
				,f_InputSectorTransformed.InputSectorName AS [@name]
				,f_InputSectorTransformed.InputSectorCode AS [@value]
				,'sector' AS [@iati-equivalent]
				,CONVERT(VARCHAR(MAX), NULLIF(f_ComponentInputSectorTransformed.percentage, 100)) + '%' AS [text()]
			FROM
				@ComponentActivityMapping ComponentActivityMapping
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_ComponentInputSectorTransformed(@VersionIdInternal, 'N')
			ON
				f_ComponentInputSectorTransformed.Percentage != 0
				AND ComponentActivityMapping.ComponentId = f_ComponentInputSectorTransformed.ComponentId
			INNER JOIN
				[ProjectDataMart].AgressoTransformation.f_InputSectorTransformed(@VersionIdInternal, 'N')
			ON
				f_ComponentInputSectorTransformed.InputSectorCode = f_InputSectorTransformed.InputSectorCode

			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
			IF @@TRANCOUNT > 0
				ROLLBACK TRANSACTION

			EXEC Configuration.p_ErrorHandler
		END CATCH--
		
		/* Update [IATI].Population with End date of the procedure */
		UPDATE [PublicationControl].Population SET EndDateTime = GETDATE() WHERE PopulationId = @PopulationId

		COMMIT

	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRANSACTION

		EXEC Configuration.p_ErrorHandler
	END CATCH

















GO
/****** Object:  StoredProcedure [PublicationControl].[p_PrintProgress]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [PublicationControl].[p_PrintProgress]
(
	@Message NVARCHAR(400) -- maximum permitted size of a unicode string parameter to PRINT
)
AS
	PRINT @Message + N': ' + CONVERT(NVARCHAR(8), GETDATE(), 108)




GO
/****** Object:  StoredProcedure [PublicationControl].[p_UpdateComponentsOnStaging]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PublicationControl].[p_UpdateComponentsOnStaging] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	--perhaps can't be transactional to perform all steps below....
	BEGIN TRY BEGIN TRANSACTION;
		
		--//UPDATE ComponentsOnStaging to reset any withdrawn components that should now to published (reset Status to 'AwaitingPublication')
		UPDATE [PublicationControl].[ComponentsOnStaging] SET Status = 'Published'
				WHERE Status IN ('AwaitingPublication')
				AND ProjectCode NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND Status='Open')
			
		UPDATE [PublicationControl].[ComponentsOnStaging] SET Status = 'Withdrawn'
               WHERE Status IN ('ToBeWithdrawn') OR (ProjectCode IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND Status='Open')
               AND Status IN ('Published', 'AwaitingPublication'))
		                 
	COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
           DECLARE @ErrorMessage NVARCHAR(4000); DECLARE @ErrorSeverity INT; DECLARE @ErrorState INT;
           SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
           RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH                
    
END


GO
/****** Object:  StoredProcedure [PublicationControl].[p_UpdateInActiveProcurementFlag]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
--CREATE PROCEDURE [PublicationControl].[p_UpdateInActiveProcurementFlag] 
--AS
--BEGIN
--	-- SET NOCOUNT ON added to prevent extra result sets from
--	-- interfering with SELECT statements.
--	SET NOCOUNT ON;
--	--perhaps can't be transactional to perform all steps below....
--	BEGIN TRY BEGIN TRANSACTION;
	
		
--		UPDATE [PublicationControl].[ComponentsOnStaging] SET StatusFinData = 'InActiveProcurement' 
--			WHERE StatusFinData = 'Release' 
--				  AND ComponentCode IN (SELECT DISTINCT ComponentId FROM [SERVER_NAME].[ProjectDataMart].[PPI].[v_Component] 
--										WHERE InActiveProcurement = 'y')
        
        
--        UPDATE [PublicationControl].[ComponentsOnStaging] SET StatusFinData = 'Release' 
--			WHERE StatusfinData = 'InActiveProcurement' 
--				  AND ComponentCode NOT IN (SELECT DISTINCT ComponentId FROM [SERVER_NAME].[ProjectDataMart].[PPI].[v_Component] 
--										WHERE InActiveProcurement = 'y')
        
         
                    
--	COMMIT TRANSACTION;
--	END TRY
--	BEGIN CATCH
--        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
--           DECLARE @ErrorMessage NVARCHAR(4000); DECLARE @ErrorSeverity INT; DECLARE @ErrorState INT;
--           SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
--           RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
--    END CATCH                
    
--END



GO
/****** Object:  StoredProcedure [PublicationControl].[p_UpdateStageComponent]    Script Date: 20-02-2017 11:25:30 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [PublicationControl].[p_UpdateStageComponent] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    BEGIN TRY BEGIN TRANSACTION;
    
			DELETE FROM [PublicationControl].[stageComponent]
		
			INSERT INTO [PublicationControl].[stageComponent](ProjectCode, ComponentCode, ComponentTitle, StartDate, EndDate, FundingTypeCode, BudgetOriginal, InProcurement, StatusFinData)
                    SELECT DISTINCT comp.ProjectId, comp.ComponentId, comp.ComponentTitle, comp.OperationalStartDate, comp.OperationalEndDate, FundingTypeCode,
                    CASE WHEN comp.ComponentId IN (SELECT DISTINCT ComponentCode FROM [PublicationControl].[ComponentsOnStaging] WHERE StatusFinData IN ('InActiveProcurement', 'HideFinData')) 
								OR comp.ProjectId IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND StatusFinData IN ('HideFinData'))
								OR comp.ComponentId IN (SELECT DISTINCT ComponentCode FROM [PublicationControl].[ComponentsOnStaging] WHERE StatusFinData IN ('HideBudgetOnly'))
								OR comp.ProjectId IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND StatusFinData IN ('HideBudgetOnly')) THEN Null
                    ELSE ComponentBudgetOriginal
                    END AS BudgetOriginal,
                    CASE WHEN comp.ComponentId IN (SELECT DISTINCT ComponentCode FROM [PublicationControl].[ComponentsOnStaging] WHERE StatusFinData IN ('InActiveProcurement', 'HideFinData')) 
								OR comp.ProjectId IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND StatusFinData IN ('HideFinData'))
								OR comp.ComponentId IN (SELECT DISTINCT ComponentCode FROM [PublicationControl].[ComponentsOnStaging] WHERE StatusFinData IN ('HideBudgetOnly'))
								OR comp.ProjectId IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND StatusFinData IN ('HideBudgetOnly')) THEN 'y'
                    ELSE 'n'
                    END AS InProcurement,
                    CASE WHEN comp.ComponentId IN (SELECT DISTINCT ComponentCode FROM [PublicationControl].[ComponentsOnStaging] WHERE StatusFinData IN ('InActiveProcurement', 'HideFinData')) 
								OR comp.ProjectId IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND StatusFinData IN ('HideFinData')) THEN 'HideFinData'
                    WHEN comp.ComponentId IN (SELECT DISTINCT ComponentCode FROM [PublicationControl].[ComponentsOnStaging] WHERE StatusFinData IN ('HideBudgetOnly'))
								OR comp.ProjectId IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND StatusFinData IN ('HideBudgetOnly')) THEN 'HideBudgetOnly'
                    ELSE 'Release'
                    END AS StatusFinData
						FROM [IATI].[PublicationControl].[v_Component] comp
							WHERE comp.ComponentId IN (SELECT DISTINCT ComponentCode FROM [PublicationControl].[ComponentsOnStaging] WHERE Status IN ('Published', 'AwaitingPublication'))
							AND comp.ProjectId NOT IN (SELECT DISTINCT ID FROM [PublicationControl].[ExclusionDetails] WHERE ExclusionType='Project' AND Status='Open')
			
			-- Temporary Fix to publish selected components with the Funding Type Code 'OTHER'
			INSERT INTO [PublicationControl].[stageComponent](ProjectCode, ComponentCode, ComponentTitle, StartDate, EndDate, FundingTypeCode, BudgetOriginal, InProcurement, StatusFinData)
			SELECT comp.ProjectId, comp.ComponentId, comp.ComponentTitle, comp.OperationalStartDate, comp.OperationalEndDate, FundingTypeCode, ComponentBudgetOriginal, 'n' AS InProcurement, 'Release' AS StatusFinData
			FROM [IATI].[PublicationControl].[v_Component] comp
			WHERE ComponentId IN ('114293-104','202867-102','202869-102','202927-102')       							
    
			UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Admin capital' WHERE FundingTypeCode = 'ADMINCAPITAL'
			UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Admin resource' WHERE FundingTypeCode = 'ADMINRESOURCE'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Development bank replenishment' WHERE FundingTypeCode = 'DEVBANKREPLENISH'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Budget support' WHERE FundingTypeCode IN ('GENBUDGETSUPPORT', 'SECTORBUDGETSUPPORT')
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Emergency aid' WHERE FundingTypeCode = 'HUMANITASSISTANCE';
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Indeterminable funding mechanism' WHERE FundingTypeCode = 'INDETERMINABLE'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Multilateral organisation' WHERE FundingTypeCode = 'MULTILATORGANISATION'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Other financial aid to government' WHERE FundingTypeCode = 'NONBUDSUPPFINAID'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Not for profit organisation' WHERE FundingTypeCode = 'NOTFORPROFITORG'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Other' WHERE FundingTypeCode = 'OTHER'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Other bilateral donor' WHERE FundingTypeCode = 'OTHERBILATERALDONOR'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Procurement of services' WHERE FundingTypeCode = 'PROCOFSERVICES'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'Procurement of goods' WHERE FundingTypeCode = 'PROCUREMENTOFGOODS'
            UPDATE [PublicationControl].[stageComponent] SET PPIFundingTypeName = 'RAR' WHERE FundingTypeCode = 'RAR'
    

    COMMIT TRANSACTION;
	END TRY
	BEGIN CATCH
        IF @@TRANCOUNT > 0 ROLLBACK TRANSACTION;
           DECLARE @ErrorMessage NVARCHAR(4000); DECLARE @ErrorSeverity INT; DECLARE @ErrorState INT;
           SELECT @ErrorMessage = ERROR_MESSAGE(), @ErrorSeverity = ERROR_SEVERITY(), @ErrorState = ERROR_STATE();
           RAISERROR (@ErrorMessage, @ErrorSeverity, @ErrorState);
    END CATCH
END





GO
USE [master]
GO
ALTER DATABASE [IATIv201] SET  READ_WRITE 
GO
