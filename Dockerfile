# Temel olarak Node.js 18 sürümünü kullanıyoruz
FROM node:18-alpine

# Çalışma dizinini oluştur ve ayarla
WORKDIR /app

# Paketleri yüklemeden önce package.json dosyasını kopyalayın
COPY package.json ./

# Yarn yerine npm kullanıyorsanız, aşağıdaki satırı değiştirebilirsiniz
RUN yarn install
# Eğer npm kullanıyorsanız:
# RUN npm install

# Projenizin tüm dosyalarını kopyalayın
COPY . .

# Ortam değişkeni ayarları
ENV NODE_ENV=production

# Strapi build (üretim için)
RUN yarn build
# Eğer npm kullanıyorsanız:
# RUN npm run build

# Uygulamayı çalıştır
# CMD ["yarn", "start"]
# Eğer npm kullanıyorsanız:
CMD ["npm", "start"]

# Strapi portu
EXPOSE 1337
