/****** Object:  StoredProcedure [dbo].[Truncate_DEX_Rec_Interface_Shipment_Order]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Usama Awan
-- Create Date: 04/Feb/2022
-- Description: Truncate matching orders table for next Site Code.
-- =============================================
CREATE PROCEDURE [dbo].[Truncate_DEX_Rec_Interface_Shipment_Order]
AS
BEGIN
	TRUNCATE TABLE DEX_Rec_Interface_Shipment_Order
end


GO
