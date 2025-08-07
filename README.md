# TecMenu

![Python](https://img.shields.io/badge/Python-3.10%2B-blue)
![PyQt5](https://img.shields.io/badge/GUI-PyQt5-green)
![MySQL](https://img.shields.io/badge/Database-MySQL-blue)
![Status](https://img.shields.io/badge/Status-Student%20Project-yellow)
![License](https://img.shields.io/badge/License-MIT-lightgrey)

**TecMenu** is a desktop application built with Python, PyQt5, and MySQL to assist restaurants in managing their ingredient inventory and generating compatible dish suggestions based on available stock. Developed as a computer engineering student project, TecMenu aims to optimize kitchen operations and prevent order delays when ingredients run out.

---

## 🧩 Features

- ✅ **Ingredient Selection** – Choose available ingredients from stock.
- ✅ **Dish Generation** – View dishes that can be prepared based on selected ingredients.
- ✅ **Database Integration** – Fully integrated with MySQL to persist data.
- ✅ **User Management** – Admins can manage user credentials and roles.
- ✅ **Inventory Management** – Track ingredients in stock and their quantities.
- ✅ **Product Solicitation** – Identify ingredients that need to be reordered.
- ✅ **Role-Based Access Control** – Different interfaces for Admins and Staff.
- ✅ **Real-Time Inventory Updates** – Ingredient availability adjusts dynamically as dishes are selected.

---

## 🛠️ Tech Stack

- **Python 3.x**
- **PyQt5** – GUI framework
- **MySQL** – Relational database
- **MySQL Connector for Python**

---

## 📁 Project Structure

TecMenu/
├── controllers/
│   └── controle_tecmenu.py      # Main entry point
├── models/
│   └── user.py                  # User and role management
├── views/
│   ├── login.ui                 # Login interface
│   └── main_window.ui          # Main application interface
├── database/
│   └── init.sql                 # SQL script to set up MySQL schema
├── utils/
│   └── helper.py                # Utility functions
├── requirements.txt            # Python dependencies
└── README.md

---

## 🚀 Installation & Setup

### 1. Clone the Repository
git clone https://github.com/yourusername/tecmenu.git
cd tecmenu

### 2. Install Dependencies
Make sure you have Python installed (latest version recommended).

pip install -r requirements.txt

If you don’t have a `requirements.txt`, create one with:

pip freeze > requirements.txt

Minimum dependencies:

PyQt5
mysql-connector-python

### 3. Set Up the Database
- Ensure MySQL is installed and running.
- Create a database manually in MySQL (e.g. tecmenu_db).
- Use the provided SQL script to set up the tables:

mysql -u youruser -p tecmenu_db < database/init.sql

- Update the DB credentials inside the source code (typically in a config section or inside controle_tecmenu.py).

### 4. Run the Application

python controllers/controle_tecmenu.py

---

## 🧑‍💻 Usage

- On startup, click to open the login window.
- The system includes a default admin account:
  - Username: admin
  - Password: admin
- ⚠️ Important: For security, log in and create a new admin account, then delete the default one.
- Admin and regular users have different dashboards based on their role.
- Start by adding ingredients to inventory.
- Select ingredients to view compatible dishes.

---

## 📌 Notes

- This project was developed as part of a technical test by a computer engineering student.
- The code is fully functional and demonstrates integration of GUI, backend, and database logic.
- No automated setup or environment configuration is included — initial setup is manual.

---

## 📜 License

This project is for academic/demo purposes. Feel free to fork and build on it.

---

## 🤝 Contributions

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

---

## 👨‍🎓 Author

Developed by a Computer Engineering student — passionate about building practical software for real-world problems.
