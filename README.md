BRAVO.iOS.Challenge.06CoreData
==============================

This challenge is the first in a series involving Core Data best practices. The goal of the first of these challenges is to write a solution for parsing data and saving to or updating a Core Data database in a manner which performs well and is maintainable.

The data for this challenge represent a simplified Nerdery employee timesheet system. You should create a schema which incorporates the following assumptions:

1. All employees will have a first name, a last name, a hire date, and a unique indentifier.
2. An employee may be a manager and have other employees as direct reports. All employees who do not have direct reports will have a relationship with their associated manager. Managers do not have managers.
3. Some employees who are not managers may be mentors, and have other employees as mentees. All employees who are not mentors or managers will have a relationship with their associated mentor. Managers and mentors do not have mentors.
4. A PBR record will have a reference to an employee, the date of the week for the record, and a breakdown of the 40 hours that the employee worked during the week, split into four parts: client, bravo, zero, and admin.

A controller object, NRDDataController, has been provided with two methods stubbed out for you to complete. The first, parseInitialDataWithCompletionBlock, should operate on the initialSampleData.json file to populate the database. The second, parseUpdateDataWithCompletionBlock, will use the updateSampleData.json file to update the already populated database.
