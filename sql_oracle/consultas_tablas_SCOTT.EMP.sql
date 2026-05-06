/* CONSULTAS A LAS TABLAS EMP Y DEPT (1) */

-- 1. Indica el código de empleado y el nombre de los que ganen un salario entre 1000 y 2000, ordénalos por el nombre de la A a la Z. 

SELECT EMPNO, ENAME
FROM EMP
WHERE SAL BETWEEN 1000 AND 2000
ORDER BY 2;

-- 2. Indica el código de los empleados que tienen comisión.

SELECT EMPNO 
FROM EMP
WHERE COMM IS NOT NULL;

-- 3. Indica la fecha de ingreso, nombre y comisión de aquellos cuyo salario sea superior a 500, tengan comisión no nula y jefe.

SELECT HIREDATE, ENAME, COMM
FROM EMP
WHERE SAL > 500 AND COMM IS NOT NULL AND MGR IS NOT NULL;

-- 4. Indica los empleados con sus nombres que hayan ingresado en la empresa antes de 1/05/1981.

SELECT ENAME
FROM EMP
WHERE HIREDATE < '1-5-81';

-- 5. Indica el código de empleado ordenado ascendentemente de los empleados ingresados entre 1/1/1980 y el 1/12/1981 siempre que sean del depto 10 ó 20, tengan de jefe al 7698 y sean MANAGER o SALESMAN.

SELECT EMPNO
FROM EMP
WHERE HIREDATE 
  BETWEEN '1-1-80' 
  AND '1-12-81' 
  AND DEPTNO IN(10,20) 
  AND MGR IN(7698) 
  AND JOB IN('MANAGER','SALESMAN');

-- 6. Saca un listado de todos los empleados, junto a sus jefes, siempre que el jefe no sea KING.

SELECT ENAME, MGR 
FROM EMP
WHERE MGR <> ( SELECT EMPNO
               FROM EMP
               WHERE ENAME='KING'
              );

-- 7. Saca un listado del nombre, código y salario de aquellos que tengan en su oficio una A en su segundo y penúltimo carácter, o sean de los departamentos 10 ó 20.

SELECT ENAME, EMPNO, SAL
FROM EMP
WHERE JOB LIKE '_A%A_' OR DEPTNO IN(10,20);

-- 8. Saca la media del salario por departamento y órdenalo de mayor a menor.

SELECT DEPTNO, ROUND(AVG(SAL),2) AS SAL 
FROM EMP
GROUP BY DEPTNO
ORDER BY SAL DESC;

-- 9. Mostrar al empleado con su salario anualizado y con el nombre de la columna SAL AÑO. Tomando el salario de la tabla como mensual. Después añadir lo mismo pero con la comisión.

SELECT ENAME AS NOMBRE, 
       SAL*12 AS SAL_ANUAL, 
       NVL(COMM*12,0) AS COMISION_ANUAL
FROM EMP_

-- 10. Selecciona los distintos salarios existentes en el departamento 30.

SELECT DISTINCT SAL
FROM EMP
WHERE DEPTNO=30;