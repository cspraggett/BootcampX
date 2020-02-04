SELECT asn.id,
       asn.name,
       asn.day,
       asn.chapter,
       count(ar.*) as total_requests
FROM assignments asn
JOIN assistance_requests ar ON asn.id = assignment_id
GROUP BY asn.id
ORDER BY total_requests DESC;