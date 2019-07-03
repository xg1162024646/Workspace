CREATE OR REPLACE PACKAGE PKG_BZ_KMS_KA_ALL IS
  /***************************
     AUTHOR  : XIEGANG
     CREATED : 20190701
     PURPOSE : KMS
   ***************************/

    -- AUTHOR  : XIEGANG
    -- CREATED : 20190701
    -- PURPOSE : KA抓单单据数据
    PROCEDURE P_KMS_KA_INVOICES_DATA(P_KA_NAME VARCHAR2,    --商超名称
                                   P_INVOICES_TYPE VARCHAR2 --单据类型
    );
    -- AUTHOR  : XIEGANG
    -- CREATED : 20190701
    -- PURPOSE : KA抓单商品数据
    PROCEDURE P_KMS_KA_GOODS_DATA(P_INVOICES_TYPE VARCHAR2, --单据类型
                                  P_ORDER_NUMBER VARCHAR2   --订单号
    );
END PKG_BZ_KMS_KA_ALL;
/
CREATE OR REPLACE PACKAGE BODY PKG_BZ_KMS_KA_ALL IS
  /***************************
     AUTHOR  : XIEGANG
     CREATED : 20190701
     PURPOSE : KMS
   ***************************/

    PROCEDURE P_KMS_KA_INVOICES_DATA(P_KA_NAME VARCHAR2,    --商超名称
                                   P_INVOICES_TYPE VARCHAR2 --单据类型
    );
    PROCEDURE P_KMS_KA_GOODS_DATA(P_INVOICES_TYPE VARCHAR2, --单据类型
                                  P_ORDER_NUMBER VARCHAR2   --订单号
    );
    

END PKG_BZ_KMS_KA_ALL;
/
