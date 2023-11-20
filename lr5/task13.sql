SELECT ROW_NUMBER() OVER (ORDER BY joindate) AS ParticipantNumber,
       memid AS MemberID,
       firstname AS FirstName,
       surname AS LastName
FROM members
ORDER BY ParticipantNumber;
