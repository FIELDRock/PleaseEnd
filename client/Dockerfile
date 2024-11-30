# ใช้ Node.js เป็น base image
FROM node:20

# ตั้งค่า working directory
WORKDIR /usr/src/app

# คัดลอก package.json และ package-lock.json
COPY client/package*.json ./

# ติดตั้ง dependencies
RUN npm install --force
RUN npm install react-scripts -g --force

# คัดลอกโค้ดทั้งหมดไปยัง container
COPY client/public ./public
COPY client/src ./src

# สร้างไฟล์ .env โดยสุ่มค่าต่าง ๆ
RUN echo "REACT_APP_DEV_URL=http://$PUBLIC_IP:1337" >> .env && \
    echo "REACT_APP_STRIPE_APP_KEY=$(openssl rand -hex 32)" >> .env && \
    echo "REACT_APP_STRIPE_PUBLISHABLE_KEY=$(openssl rand -hex 32)" >> .env

# Build the app
RUN npm run build

# Expose port
EXPOSE 3000

# Start the app
CMD ["npm", "start"]
