-- All follow-up communications for a specific property.
select * from combined_follow_up_data
where Property_ID = 241;    		

-- Summarising personalized or generalized and tour_confirmations columns
SELECT 
    COUNT(CASE WHEN Personalized_or_Generalized = 'Personalized' THEN 1 END) AS Personalized_Count,
    COUNT(CASE WHEN Personalized_or_Generalized = 'Generalized' THEN 1 END) AS Generalized_Count,
    count(Case when Tour_Confirmation = True then 1 end) as tour_confirmations,
    count(case when booking_link = true then 1 end) as Booking_link,
    count(case when Requests_Tour_Booking = true then 1 end) as requests_for_tour
FROM classified_follow_up_data;
 
 -- Count of properties with no follow ups
SELECT Property_ID , count(property_id) as No_follow_ups_count
FROM follow_up_count
WHERE Total_Follow_Ups = 'No Follow up'
group by property_ID;

-- Count of properties and their total number of follow ups
SELECT Property_ID, SUM(CAST(Total_Follow_Ups AS SIGNED)) AS Total_Follow_Ups_Sum
FROM follow_up_count
WHERE Total_Follow_Ups != 'No Follow up' AND Total_Follow_Ups != 'Not Contacted'
GROUP BY Property_ID;
