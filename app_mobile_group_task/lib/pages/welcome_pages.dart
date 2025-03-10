part of 'pages.dart';

class WellcomePage extends StatefulWidget {
  const WellcomePage({super.key});

  @override
  State<WellcomePage> createState() => _WellcomePageState();
}

class _WellcomePageState extends State<WellcomePage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _isHiddenPassword = true;

  void _login() {
    String username = usernameController.text;
    String password = passwordController.text;

    if (username == "fulan" && password == "fulan") {
      // Jika login berhasil, pindah ke HomePage
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage()),
      );
    } else {
      // Jika login gagal
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Username atau password salah!"),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFE9C46A), // Warna latar belakang sesuai logo
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/burger2.png',
                height: 120,
              ),
              const SizedBox(height: 20),
              const Text(
                "Login",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                  color:
                      Color(0xFF452C25), // Warna teks lebih cocok dengan logo
                ),
              ),
              const SizedBox(height: 5),
              const Text(
                "Login untuk mengakses lebih banyak fitur.",
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF6D4C3D), // Warna teks lebih lembut
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              TextField(
                controller: usernameController,
                decoration: InputDecoration(
                  prefixIcon:
                      const Icon(Icons.person, color: Color(0xFF452C25)),
                  hintText: "Username",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: passwordController,
                obscureText: _isHiddenPassword,
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Color(0xFF452C25)),
                  hintText: "Password",
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _isHiddenPassword
                          ? Icons.visibility_off
                          : Icons.visibility,
                      color: Color(0xFF452C25),
                    ),
                    onPressed: () {
                      setState(() {
                        _isHiddenPassword = !_isHiddenPassword;
                      });
                    },
                  ),
                ),
              ),
              const SizedBox(height: 25),
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  onPressed: _login,
                  style: ElevatedButton.styleFrom(
                    backgroundColor:
                        Color(0xFF264653), // Warna tombol lebih kontras
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(25),
                    ),
                  ),
                  child: const Text(
                    "Login",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
