# Temel olarak Node.js 18 sürümünü kullanıyoruz
FROM node:18-alpine

# Çalışma dizinini oluştur ve ayarla
WORKDIR /app

# Paketleri yüklemeden önce bağımlılık dosyalarını kopyalayın
COPY package.json ./
COPY yarn.lock ./

# Strapi bağımlılıklarını yükleyin
RUN yarn install

# Projenizin tüm dosyalarını kopyalayın
COPY . .

# Ortam değişkeni ayarları
ENV NODE_ENV=production

# Strapi build (üretim için)
RUN yarn build

# Uygulamayı çalıştır
CMD ["yarn", "start"]

# Strapi portu
EXPOSE 1337
