# Import required library
import pymongo

# Connect to MongoDB
client = pymongo.MongoClient("mongodb://localhost:27017/")
db = client["mydatabase"]  # Replace "mydatabase" with your database name

# Get a reference to the collection
collection = db["mycollection"]  # Replace "mycollection" with your collection name

# Program to insert one document into a collection
document = {
    "name": "John Doe",
    "age": 30,
    "email": "john@example.com"
}
inserted_document = collection.insert_one(document)
print("Document inserted with ID:", inserted_document.inserted_id)

# Program code to perform CRUD operations
new_document = {
    "name": "Jane Smith",
    "age": 28,
    "email": "jane@example.com"
}

# Create
inserted_document = collection.insert_one(new_document)
print("Document inserted with ID:", inserted_document.inserted_id)

# Read
document_to_read = collection.find_one({"name": "John Doe"})
print("Read Document:", document_to_read)

# Update
collection.update_one({"name": "John Doe"}, {"$set": {"age": 31}})
updated_document = collection.find_one({"name": "John Doe"})
print("Updated Document:", updated_document)

# Delete
deleted_document = collection.delete_one({"name": "Jane Smith"})
print("Deleted Document Count:", deleted_document.deleted_count)
