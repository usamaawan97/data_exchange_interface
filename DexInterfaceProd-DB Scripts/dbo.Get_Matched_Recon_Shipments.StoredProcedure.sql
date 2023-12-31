/****** Object:  StoredProcedure [dbo].[Get_Matched_Recon_Shipments]    Script Date: 10/27/2022 8:36:14 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:      Usama Awan
-- Create Date: 04/Feb/2022
-- Description: Get Shipment XML of Matched Order Number.
-- =============================================

-- EXEC [dbo].[Get_Matched_Recon_Shipments] 'TLUS-102667','15852'

CREATE PROCEDURE [dbo].[Get_Matched_Recon_Shipments]
@OrderNo nvarchar(250),
@DexInterfaceDocMID INT
AS

BEGIN
SELECT(
		
					SELECT  [FileData].query('Shipments/Shipment[No=sql:variable("@OrderNo")]') 
					FROM	[dbo].[DEX_Interface_Document]
					WHERE	MessageID = @DexInterfaceDocMID
					FOR XML PATH(''), TYPE	 
			  
	) AS ReconXML
END

GO
