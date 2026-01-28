/*

Foundation Recap Exercise
 
Use the table PatientStay.  

This lists 44 patients admitted to London hospitals over 5 days between Feb 26th and March 2nd 2024

*/
SELECT 
  -- *
 
 ps.PatientID,
 ps.Hospital, 
 ps.Ward,
 ps.AdmittedDate,
 ps.DischargeDate,
 DATEDIFF(DAY, AdmittedDate, DischargeDate) AS LengthOfStay, 
 DATEADD(MONTH, 3, ps.DischargeDate) AS AppointmentDate
  FROM 
  PatientStay ps
 WHERE ps.Hospital IN('Oxleas', 'PRUH')
 AND MONTH(ps.AdmittedDate) = 2
 AND YEAR(ps.AdmittedDate) = 2024
 AND Ward LIKE '%Surgery' 
 ORDER BY ps.AdmittedDate DESC, ps.PatientId DESC 


 -- ORDER BY
 -- AND 
 /*

1. Filter the list the patients to show only those  -

a) in the Oxleas hospital,

b) and also in the PRUH hospital,

c) admitted in February 2024

d) only the surgical wards (i.e. wards ending with the word Surgery)
 
 
2. Show the PatientId, AdmittedDate, DischargeDate, Hospital and Ward columns only, not all the columns.

3. Order results by AdmittedDate (latest first) then PatientID column (high to low)

4. Add a new column LengthOfStay which calculates the number of days that the patient stayed in hospital, inclusive of both admitted and discharge date.

*/
 
-- Write the SQL statement here
 
 SELECT
 ps.Hospital, 
 ps.Ward,
 COUNT(PatientId) AS admissions,
 SUM(ps.Tariff) AS Costs
 FROM PatientStay ps
 GROUP BY ps.Hospital, ps.Ward 
 ORDER BY COUNT(PatientId)
 HAVING COUNT(*) > 10
/*

5. How many patients has each hospital admitted? 

6. How much is the total tariff for each hospital?

7. List only those hospitals that have admitted over 10 patients

8. Order by the hospital with most admissions first

*/
 
-- Write the SQL statement here
 