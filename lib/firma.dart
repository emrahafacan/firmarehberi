import 'package:flutter/material.dart';

class Firma {
  final String resim, baslik, aciklama, kategori;
  final int price, size, id;
  final Color color;
  Firma(
      {this.id,
      this.resim,
      this.baslik,
      this.aciklama,
      this.color,
      this.price,
      this.size,
      this.kategori});
}

List<Firma> firmalar = [
  Firma(
    id: 1,
    baslik: 'AFC Bilişim',
    color: Color(0xFF0721bb),
    aciklama:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cursus quam tellus, vel imperdiet sem blandit ac. In commodo leo et ipsum ultricies egestas. Duis faucibus, tellus consequat viverra fringilla, urna mi vulputate metus, ac posuere est justo vel orci. Praesent quis orci lectus. Vivamus orci leo, condimentum at lorem non, consequat elementum tortor. Cras vehicula quis tellus eu iaculis. In malesuada ut ex quis laoreet. Cras tincidunt magna porttitor euismod dictum.',
    price: 234,
    resim: 'assets/images/bag_1.png',
    size: 12,
    kategori: 'Yazılım',
  ),
  Firma(
    id: 2,
    baslik: 'Doğan Çanta',
    color: Color(0xFF211f1f),
    aciklama:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cursus quam tellus, vel imperdiet sem blandit ac. In commodo leo et ipsum ultricies egestas. Duis faucibus, tellus consequat viverra fringilla, urna mi vulputate metus, ac posuere est justo vel orci. Praesent quis orci lectus. Vivamus orci leo, condimentum at lorem non, consequat elementum tortor. Cras vehicula quis tellus eu iaculis. In malesuada ut ex quis laoreet. Cras tincidunt magna porttitor euismod dictum.',
    price: 234,
    resim: 'assets/images/bag_2.png',
    size: 12,
    kategori: 'Giyim',
  ),
  Firma(
    id: 3,
    baslik: 'Bosna Etliekmek',
    color: Color(0xFF097d1f),
    aciklama:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cursus quam tellus, vel imperdiet sem blandit ac. In commodo leo et ipsum ultricies egestas. Duis faucibus, tellus consequat viverra fringilla, urna mi vulputate metus, ac posuere est justo vel orci. Praesent quis orci lectus. Vivamus orci leo, condimentum at lorem non, consequat elementum tortor. Cras vehicula quis tellus eu iaculis. In malesuada ut ex quis laoreet. Cras tincidunt magna porttitor euismod dictum.',
    price: 234,
    resim: 'assets/images/bag_3.png',
    size: 12,
    kategori: 'Restoran',
  ),
  Firma(
    id: 4,
    baslik: 'Yaşar Emlak',
    color: Color(0xFFf74a2c),
    aciklama:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cursus quam tellus, vel imperdiet sem blandit ac. In commodo leo et ipsum ultricies egestas. Duis faucibus, tellus consequat viverra fringilla, urna mi vulputate metus, ac posuere est justo vel orci. Praesent quis orci lectus. Vivamus orci leo, condimentum at lorem non, consequat elementum tortor. Cras vehicula quis tellus eu iaculis. In malesuada ut ex quis laoreet. Cras tincidunt magna porttitor euismod dictum.',
    price: 234,
    resim: 'assets/images/bag_4.png',
    size: 12,
    kategori: 'Emlak',
  ),
  Firma(
    id: 5,
    baslik: 'Bosna Emlak',
    color: Color(0xFF872d00),
    aciklama:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cursus quam tellus, vel imperdiet sem blandit ac. In commodo leo et ipsum ultricies egestas. Duis faucibus, tellus consequat viverra fringilla, urna mi vulputate metus, ac posuere est justo vel orci. Praesent quis orci lectus. Vivamus orci leo, condimentum at lorem non, consequat elementum tortor. Cras vehicula quis tellus eu iaculis. In malesuada ut ex quis laoreet. Cras tincidunt magna porttitor euismod dictum.',
    price: 234,
    resim: 'assets/images/bag_5.png',
    size: 12,
    kategori: 'Emlak',
  ),
  Firma(
    id: 6,
    baslik: 'Çilingir Anahtarcı',
    color: Color(0xFFaa1917),
    aciklama:
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Ut cursus quam tellus, vel imperdiet sem blandit ac. In commodo leo et ipsum ultricies egestas. Duis faucibus, tellus consequat viverra fringilla, urna mi vulputate metus, ac posuere est justo vel orci. Praesent quis orci lectus. Vivamus orci leo, condimentum at lorem non, consequat elementum tortor. Cras vehicula quis tellus eu iaculis. In malesuada ut ex quis laoreet. Cras tincidunt magna porttitor euismod dictum.',
    price: 234,
    resim: 'assets/images/bag_6.png',
    size: 12,
    kategori: 'Çilingir',
  ),
];
