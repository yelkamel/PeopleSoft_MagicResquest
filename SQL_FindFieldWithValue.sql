DECLARE
  VCOLNAME VARCHAR2(30) := 'EMPLID'; --(CHAMP QUON VEUT)
  vValSearch varchar2(30) := 'J47504998'; --(valeur)
  vCount integer :=0;
  vSQL varchar2(256);
  CURSOR cListTable(pColName IN all_tab_columns.column_name%type) IS
    SELECT C.TABLE_NAME
    FROM
      ALL_TAB_COLUMNS C
    , ALL_TABLES T
    WHERE
        T.TABLE_NAME = C.TABLE_NAME
    AND C.COLUMN_NAME = pColName;
BEGIN
  FOR CUR IN CLISTTABLE(VCOLNAME) LOOP
    vSQL := 'Select count(1) from ' || cur.TABLE_NAME || ' WHERE ' || vColName || ' = ''' || vValSearch || '''' ;
    EXECUTE IMMEDIATE vSQL INTO vCount;
    IF VCOUNT > 0 THEN
      dbms_output.put_line('SELECT * FROM ' || Cur.TABLE_NAME || ' WHERE ' || vColName || ' = ''' || vValSearch ||''';');
    end if;
  End loop;
END;
/
-- Activé l'affichage de la sortie SGBD de la Base utiliser  :)
