CREATE OR REPLACE PACKAGE PKG_BZ_KMS_KA_ALL IS
  /***************************
     AUTHOR  : XIEGANG
     CREATED : 20190701
     PURPOSE : KMS
   ***************************/

    -- AUTHOR  : XIEGANG
    -- CREATED : 20190701
    -- PURPOSE : KAץ����������
    PROCEDURE P_KMS_KA_INVOICES_DATA(P_KA_NAME VARCHAR2,    --�̳�����
                                   P_INVOICES_TYPE VARCHAR2 --��������
    );
    -- AUTHOR  : XIEGANG
    -- CREATED : 20190701
    -- PURPOSE : KAץ����Ʒ����
    PROCEDURE P_KMS_KA_GOODS_DATA(P_INVOICES_TYPE VARCHAR2, --��������
                                  P_ORDER_NUMBER VARCHAR2   --������
    );
END PKG_BZ_KMS_KA_ALL;
/
CREATE OR REPLACE PACKAGE BODY PKG_BZ_KMS_KA_ALL IS
  /***************************
     AUTHOR  : XIEGANG
     CREATED : 20190701
     PURPOSE : KMS
   ***************************/

    PROCEDURE P_KMS_KA_INVOICES_DATA(P_KA_NAME VARCHAR2,    --�̳�����
                                   P_INVOICES_TYPE VARCHAR2 --��������
    );
    PROCEDURE P_KMS_KA_GOODS_DATA(P_INVOICES_TYPE VARCHAR2, --��������
                                  P_ORDER_NUMBER VARCHAR2   --������
    );
    

END PKG_BZ_KMS_KA_ALL;
/
