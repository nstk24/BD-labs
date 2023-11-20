WITH SlotCounts AS (
    SELECT facid, 
           SUM(slots) AS TotalSlots
    FROM bookings
    GROUP BY facid
)
SELECT f.facid AS FacilityID,
       f.facility AS FacilityName,
       sc.TotalSlots AS TotalReservedSlots
FROM facilities f
JOIN SlotCounts sc ON f.facid = sc.facid
WHERE sc.TotalSlots = (SELECT MAX(TotalSlots) FROM SlotCounts);
