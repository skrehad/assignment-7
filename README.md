
### 1. What is PostgreSQL?
PostgreSQL একটি ওপেন-সোর্স রিলেশনাল ডাটাবেস ম্যানেজমেন্ট সিস্টেম (RDBMS) যা SQL ভাষা ব্যবহার করে ডাটা সংরক্ষণ, ম্যানেজ এবং রিকভার করতে সাহায্য করে। এটি উচ্চমাত্রার পারফরম্যান্স ও নিরাপত্তার জন্য পরিচিত।

### 2. What is the purpose of a database schema in PostgreSQL?
ডাটাবেস স্কিমা হলো ডাটার গঠন বা স্ট্রাকচার যা টেবিল, কনস্ট্রেইন্ট, ইনডেক্স এবং অন্যান্য সম্পর্কিত উপাদান ধারণ করে। এটি ডাটাবেসের গঠন নির্ধারণ করে এবং ডাটার সংহতি ও নিরাপত্তা নিশ্চিত করে।

### 3. Explain the Primary Key and Foreign Key concepts in PostgreSQL.
**প্রাইমারি কি (Primary Key)** হলো টেবিলের এমন একটি কলাম যা প্রতিটি সারির জন্য ইউনিক হয় এবং কখনো null হতে পারে না।
**ফরেন কি (Foreign Key)** হলো একটি কলাম যা অন্য একটি টেবিলের প্রাইমারি কির সাথে সম্পর্কিত হয় এবং ডাটার অখণ্ডতা বজায় রাখে।

### 4. What is the difference between the VARCHAR and CHAR data types?
- **VARCHAR(n):** পরিবর্তনশীল দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে। এটি সর্বোচ্চ `n` ক্যারেক্টার পর্যন্ত রাখতে পারে এবং ব্যবহৃত জায়গার উপর নির্ভর করে স্টোরেজ নেয়।
- **CHAR(n):** নির্দিষ্ট দৈর্ঘ্যের স্ট্রিং সংরক্ষণ করে এবং সবসময় `n` ক্যারেক্টার স্টোরেজ নেয়, এমনকি যদি স্ট্রিং ছোট হয় তাও।

### 5. Explain the purpose of the WHERE clause in a SELECT statement.
`WHERE` ক্লজ ব্যবহার করে নির্দিষ্ট শর্ত অনুযায়ী ডাটা ফিল্টার করা হয়, যাতে কেবল প্রয়োজনীয় তথ্যই রিটার্ন হয়। যেমন:
```
SELECT * FROM books WHERE price > 30;
```

### 6. What are the LIMIT and OFFSET clauses used for?
- **LIMIT:** নির্দিষ্ট সংখ্যক রেকর্ড ফেরত আনার জন্য ব্যবহৃত হয়।
- **OFFSET:** কতগুলো রেকর্ড স্কিপ করে শুরু করবে তা নির্ধারণ করে।
```
SELECT * FROM books LIMIT 5 OFFSET 10;
```

### 7. How can you modify data using UPDATE statements?
`UPDATE` স্টেটমেন্ট ব্যবহার করে টেবিলের ডাটা পরিবর্তন করা যায়। যেমন:
```
UPDATE books SET price = price * 1.10 WHERE published_year < 2000;
```

### 8. What is the significance of the JOIN operation, and how does it work in PostgreSQL?
`JOIN` ব্যবহার করে একাধিক টেবিল থেকে সম্পর্কিত ডাটা আনা যায়। যেমন:
```
SELECT customers.name, books.title FROM orders
JOIN customers ON orders.customer_id = customers.id
JOIN books ON orders.book_id = books.id;
```

### 9. Explain the GROUP BY clause and its role in aggregation operations.
`GROUP BY` ক্লজ একই ধরনের ডাটা গ্রুপ করে এবং একসাথে অ্যাগ্রিগেশন করতে সাহায্য করে। যেমন:
```
SELECT author, COUNT(*) FROM books GROUP BY author;
```

### 10. How can you calculate aggregate functions like COUNT(), SUM(), and AVG() in PostgreSQL?
- **COUNT():** মোট সারির সংখ্যা গণনা করতে ব্যবহৃত হয়।
- **SUM():** নির্দিষ্ট কলামের মোট যোগফল বের করতে ব্যবহৃত হয়।
- **AVG():** নির্দিষ্ট কলামের গড় মান বের করতে ব্যবহৃত হয়।
```
SELECT COUNT(*) FROM orders;
SELECT SUM(price) FROM books;
SELECT AVG(price) FROM books;
```
