## Case Study 2: Kultra Mega Stores Inventory Analysis (SQL)

### Project Overview
Kultra Mega Stores(KMS) headquarted in Lagos specialises in office suplies and furniture with its customer base including individual consumers, small business and coporate clients. By means of a thorough examination of KMS order data from 2009-2012, we will have a better understanding of this. 
This analysis makes use of SQL to execute queries. With this, KMS is prepared to make data-driven decisions that will fuel its growth, from identifying top selling categories and regional strengths, understanding consumer behaviour, product trnds to maximizing customer value and minimising shipping costs.

### Data Description
- The dataset containing order data from 2009 to 2012 was used for the analysis.
- Contains a total of 21 rows and 8400 columns.
- A dataset entailing a return order status was also used.

### Analysis Tasks
- Creating a database and retrieving data from the dataset.
- Exploring various aspects of of KMS's business and analyzing sales and shipping patterns from 2009-2012.
- Aimed at advising business decisions based on sales, shipping and customer behavior.
- Present key insights and findings.

For this project, the respective queries to the case scenarios (1-10) solved can be viewed here [DOWNLOAD HERE](https://github.com/Ifeoluwa260620/KMS-Analysis-Using-SQL/commit/7f88965e629d80eba71b73eeaebf3111d20c8f6c)

Also, find attached pictures of what the data ouput from the queries look like [DOWNLOAD HERE](https://github.com/Ifeoluwa260620/KMS-Analysis-Using-SQL/commit/e8d0caaa57c17ae9cc6541b74126847a2bf40e9f)

For Case Scenario 11: 
If the Delivery Truck is the most economical but slowest shipping method and Express Air is the fastest but the most expensive one, KMS did not appropriately spend shipping costs based on order priority because;
- For High & Critical Priority Orders, both Delivery Truck and Express Air were used almost equally. Therefore, using both shipping methods for urgent orders seems reasonable given the consistent delivery time.
- For Low Priority Orders, most orders (250) used Delivery Truck, which had a higher average delivery time (3 days), consistent with the claim of being slower.
- For Medium Priority Orders, both shipping methods were again used almost equally and justifies the mixed usage.
- For Not Specified Priority, similar cost and delivery profiles a mix of both shipping methods.
  
In conclusion to this, there is a misalignment of shipping method to order urgency, leading to unnecessary costs. Critical and High Priority Orders should be restricted for Express Air. Also, for Low Priority Orders, stick to Delivery Truck unless exceptional cases.

