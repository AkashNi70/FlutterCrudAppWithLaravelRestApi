# Flutter CRUD Application with Laravel Backend
This project is a demonstration of a Flutter CRUD (Create, Read, Update, Delete) application with backend API support provided by Laravel. The Flutter frontend interacts with the Laravel backend through RESTful API calls.

## Key Features :
- **CRUD Operations:** Seamlessly perform Create, Read, Update, and Delete operations on resources via a user-friendly Flutter interface.
- **Backend API Support:** Laravel backend provides robust RESTful API endpoints, facilitating efficient communication and data manipulation between the frontend and backend.
- **Scalable Architecture:** Built with scalability in mind, ensuring smooth expansion and adaptation to evolving project requirements.
- **Error Handling:** Comprehensive error handling mechanisms implemented across both frontend and backend to ensure a smooth and error-free user experience.

## Technologies Utilized :
- **Flutter:** Google's versatile UI toolkit for developing natively compiled applications across various platforms, including mobile, web, and desktop.
- **Laravel:** A powerful PHP web application framework known for its elegant syntax and robust features, providing a solid foundation for backend development.
- **MySQL:** A reliable relational database management system utilized for storing and managing application data efficiently.

## Screenshots :

![alttext](https://github.com/AkashNi70/FlutterCrudAppWithLaravelRestApi/blob/master/crudapp.png)

## Prerequisites :
Before running this application, ensure you have the following installed:

- Flutter SDK
- Laravel environment (Composer, PHP, MySQL)
- MySQL Server

## Installation
**Frontend (Flutter)**

&nbsp;1. Clone this repository:

    git clone https://github.com/AkashNi70/FlutterCrudAppWithLaravelRestApi.git

&nbsp;2. Navigate to the FlutterCrudAppWithLaravelRestApi directory:

    cd your-project-directory/FlutterCrudAppWithLaravelRestApi

&nbsp;3. Install dependencies::

    flutter pub get

&nbsp;4. Run the application::

    flutter run

### Backend (Laravel)

&nbsp;1. Clone the Laravel API Repository:

    git clone https://github.com/AkashNi70/FlutterCrudAppWithLaravelRestApi.git

&nbsp;2. Navigate to the Laravel Project Directory:

    cd FlutterCrudAppWithLaravelRestApi/crudapi

&nbsp;3. Install PHP Dependencies:

    composer install

&nbsp;4. Rename database in `.env` File::

    DB_CONNECTION=mysql
    DB_HOST=127.0.0.1
    DB_PORT=3306
    DB_DATABASE=test
    DB_USERNAME=root
    DB_PASSWORD=

&nbsp;5. Migrate the Database:

    php artisan migrate

&nbsp;6. Start the Laravel Server:

    php artisan serve

## API Endpoints

The Laravel backend provides the following RESTful API endpoints:

- `POST /api/login`: Login url.
- `POST /api/register`: Create a new accound.
- `POST /api/add-item`: Create a new item.
- `GET /api/items`: Retrieve a all items.
- `PUT /api/items/update/{item}`: Update a specific item.
- `DELETE /api/items/delete/{id}`: Delete a specific item.

## Contributing

Contributions are highly appreciated! If you find any bugs, have suggestions, or want to contribute new features, please feel free to open an issue or submit a pull request. Your contributions will help improve the project for everyone.

## License
This project is licensed under the MIT License. For more information, please refer to the [LICENSE](LICENSE) file.

Thank you for choosing our Flutter CRUD application with Laravel backend. We hope you find it useful and enjoy exploring its capabilities! If you have any questions or need assistance, don't hesitate to reach out.
