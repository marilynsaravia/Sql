/*******************************************************************************
  EJERCICIOS SQL - TABLAS SCOTT.EMP 
  
  Entorno de pruebas recomendado: Oracle FreeSQL
  URL: https://freesql.com/
  Nota: Estas consultas utilizan el esquema estándar 'SCOTT'.
*******************************************************************************/

-- 1. Seleccionar el nombre y el salario de los empleados con alias NOMBRE Y SALARIO ANUAL de aquellos que sean SALESMAN o MANAGER, hayan ingresado en la empresa antes de  1-1-83. Ordenar por fecha mayor primero.

SELECT ENAME AS "NOMBBRE", SAL AS "SALARIO ANUAL"
FROM SCOTT.EMP
WHERE JOB IN('SALESMAN','MANAGER') 
          AND HIREDATE < '1-JAN-1983'
ORDER BY HIREDATE DESC;

-- 2. Seleccionar el salario mensual aumentado con un 5% de ipc con el alias SALARIO IPC de los que tengan un salario no comprendido entre 3000 y 5000, o su código de empleado tenga un 9 en su segundo carácter, o su departamento no sea el 10 ó el 20, siempre que cumplan ser CLERK, ANALYST o SALESMAN. Ordenar por el salario menor.

SELECT SAL/12*1.05 SALARIO_IPC
FROM SCOTT.EMP
WHERE (SAL NOT BETWEEN 3000 AND 5000
      OR EMPNO LIKE '_9%' 
      OR DEPTNO NOT IN (10,20))
      AND JOB IN('CLERK','SALESMAN','ANALYST')
ORDER BY 1;

-- 3. De los empleados con comisión nula, obtener el nombre de los que tengan de jefe al código 7839. Otra condición a culmplir es que hayan ingresado en la empresa entre 1-1-80 y 31-12-83. Ordenar por el nombre de la A a la Z.

SELECT ENAME
FROM SCOTT.EMP
WHERE COMM IS NULL AND MGR=7839 AND HIREDATE BETWEEN '1-JAN-80' AND '31-DEC-83'
ORDER BY ENAME;