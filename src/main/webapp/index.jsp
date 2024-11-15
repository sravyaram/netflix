<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Netflix</title>
    <style>
        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background-color: #141414;
            color: #fff;
        }

        /* Navbar */
        .navbar {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            padding: 20px;
            background-color: rgba(0, 0, 0, 0.7);
            display: flex;
            justify-content: space-between;
            align-items: center;
            z-index: 100;
        }
        .navbar img {
            height: 40px;
        }
        .navbar a {
            color: #fff;
            text-decoration: none;
            margin: 0 15px;
            font-size: 16px;
        }
        .navbar a:hover {
            text-decoration: underline;
        }

        /* Hero Section */
        .hero {
            height: 100vh;
            background: url('https://www.example.com/your-image.jpg') no-repeat center center/cover;
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }
        .hero h1 {
            font-size: 60px;
            margin-bottom: 20px;
        }
        .hero p {
            font-size: 20px;
            margin-bottom: 30px;
            max-width: 600px;
        }
        .hero button {
            padding: 15px 30px;
            font-size: 18px;
            background-color: #e50914;
            border: none;
            cursor: pointer;
            color: #fff;
            border-radius: 5px;
        }
        .hero button:hover {
            background-color: #f40612;
        }

        /* Section for movies */
        .section {
            padding: 40px 20px;
            text-align: center;
        }
        .section h2 {
            font-size: 30px;
            margin-bottom: 20px;
        }
        .movie-container {
            display: flex;
            justify-content: center;
            overflow-x: scroll;
        }
        .movie-card {
            margin: 0 10px;
            width: 200px;
            height: 300px;
            background-color: #333;
            border-radius: 5px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.6);
            position: relative;
        }
        .movie-card img {
            width: 100%;
            height: 100%;
            border-radius: 5px;
        }

        /* Footer */
        .footer {
            background-color: #333;
            padding: 20px;
            text-align: center;
            font-size: 14px;
        }
        .footer a {
            color: #bbb;
            text-decoration: none;
            margin: 0 10px;
        }
        .footer a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

    <!-- Navbar -->
    <div class="navbar">
        <img src="https://upload.wikimedia.org/wikipedia/commons/0/0b/Netflix-avatar.png" alt="Netflix Logo">
        <div>
            <a href="index.jsp">Home</a>
            <a href="#">TV Shows</a>
            <a href="#">Movies</a>
            <a href="#">New & Popular</a>
            <a href="#">My List</a>
        </div>
    </div>

    <!-- Hero Section -->
    <div class="hero">
        <h1>Unlimited Movies, TV Shows, and More</h1>
        <p>Watch anywhere. Cancel anytime.</p>
        <button>Sign Up Now</button>
    </div>

    <!-- Movies Section -->
    <div class="section">
        <h2>Trending Now</h2>
        <div class="movie-container">
            <div class="movie-card">
                <img src="https://www.example.com/movie1.jpg" alt="Movie 1">
            </div>
            <div class="movie-card">
                <img src="https://www.example.com/movie2.jpg" alt="Movie 2">
            </div>
            <div class="movie-card">
                <img src="https://www.example.com/movie3.jpg" alt="Movie 3">
            </div>
            <div class="movie-card">
                <img src="https://www.example.com/movie4.jpg" alt="Movie 4">
            </div>
        </div>
    </div>

    <!-- Footer -->
    <div class="footer">
        <p>Questions? Contact us.</p>
        <p>
            <a href="#">FAQ</a> | 
            <a href="#">Investor Relations</a> | 
            <a href="#">Privacy</a> | 
            <a href="#">Terms</a> | 
            <a href="#">Site Map</a>
        </p>
        <p>&copy; 2024 Netflix, Inc.</p>
    </div>

</body>
</html>
