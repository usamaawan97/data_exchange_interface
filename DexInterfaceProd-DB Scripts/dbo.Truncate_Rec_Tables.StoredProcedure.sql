/****** Object:  StoredProcedure [dbo].[Truncate_Rec_Tables]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- =============================================
-- Author:      Usama Awan
-- Create Date: 04/Feb/2022
-- Description: Truncate Shipment Tables before starting current day file process.
-- =============================================
CREATE PROCEDURE [dbo].[Truncate_Rec_Tables]
AS
BEGIN
    TRUNCATE TABLE DEX_Rec_Interface_Document
	TRUNCATE TABLE DEX_Rec_Interface_Shipment_Order
end
GO
