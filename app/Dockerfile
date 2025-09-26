# Python का बेस इमेज इस्तेमाल करें
FROM python:3.9-slim

# कंटेनर के अंदर /app फोल्डर में काम करें
WORKDIR /app

# पहले requirements.txt कॉपी करें और इंस्टॉल करें
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# बाकी का कोड कॉपी करें
COPY . .

# कंटेनर के बाहर पोर्ट 80 को खोलें
EXPOSE 80

# जब कंटेनर चले, तो यह कमांड रन करें
CMD ["gunicorn", "--bind", "0.0.0.0:80", "app:app"]