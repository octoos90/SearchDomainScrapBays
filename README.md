**Task Overview**

Build a **simple domain search app** using **Swift** and **SwiftUI**. The app will allow users to:

1.  Enter a domain name to search.

2.  Display the search results (available domains).

3.  Allow the user to “purchase” a domain (mock flow with a confirmation screen).

---

**API to use**

•  Search endpoint:

https://api.domainsdb.info/v1/domains/search?domain=facebook&zone=com

[API Documentation](https://api.domainsdb.info/v1/)

---

**Requirements**


**1. Search Screen**

•  A search bar where users can enter a domain name. 

•  The search should trigger when theres 3 or more characters in the search.

•  Display loading state while searching.

  

**2. Results Screen**

•  Show a list of matching domains.

•  Display at least the domain name and availability.

•  Handle empty states (e.g., no results, no internet).

  

**3. Purchase Screen**

•  Tapping on a domain should navigate to a **Purchase screen**.

•  Show the domain details.

•  A **“Confirm Purchase” button** that shows a success message (mock, no real purchase).

---
**Marking Criteria**

  

We’ll review your submission based on the following:

  

**Code Quality**

•  Clean, well-structured, and testable code.

•  Clear separation of concerns (MVVM preferred).

•  Use of Swift best practices.

  

**Attention to Design & Details**

•  Consistent, thoughtful UI using SwiftUI.

•  Smooth UX with loading, error, and empty states.

•  Typography, spacing, and alignment should feel intentional.

  

**Performance & UX**

•  Debounce search inputs if you choose to trigger searches on text change.

•  Fast, responsive interactions.

•  Proper error handling and user feedback.


---
**Time Limit**

  

**Please do not spend more than 2 hours on this task.**

Focus on showing your ability to structure code and handle the core flow.

**Submission Instructions**

1.  Create a public GitHub repository.

2.  Include this README.md at the root of the project.

3.  Commit your code with clear, readable commit messages.

4.  Push your work and share the link with us.


Good luck! 🎉 We’re excited to see what you build.
---
<img width="440" alt="Search screen" src="https://github.com/user-attachments/assets/2877d7f5-11f3-4d07-9011-a87b8ebf0521" />

<img width="440" alt="Results screen" src="https://github.com/user-attachments/assets/a545ff5a-a372-4d30-8ec5-09411052d779" />


<img width="440" alt="Purchase screen" src="https://github.com/user-attachments/assets/a643298b-9980-4688-9cea-d03e0444adef" />
