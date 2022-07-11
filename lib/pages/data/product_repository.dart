import 'product_model.dart';

class ProductsRepository {
  static List<ProductModel> loadProducts() {
    var allProducts = <ProductModel>[
      ProductModel(
        id: 0,
        brand: '프레자일드',
        description: '프레자일드는 우리가 지구를 대하는 자세에 대해 이야기하는 브랜드입니다.',
        title: 'Believe T-Shirt - White',
        price: '59000',
      ),
      ProductModel(
        id: 1,
        brand: '까웨',
        description: '자연과 환경을 존중하는 까웨의 친환경프로젝트 아미아블 컬렉션입니다.',
        title: '아미아블 친환경 레터링 반팔 티셔츠',
        price: '79000',
      ),
      ProductModel(
        id: 2,
        brand: '노스페이스',
        description: '사람과 자연의 더 나은 공존을 향한 노스페이스의 컬렉션입니다.',
        title: '아미아블 친환경 레터링 반팔 티셔츠',
        price: '52000',
      ),
      ProductModel(
        id: 3,
        brand: '파타고니아',
        description: '우리는 우리의 터전, 지구를 되살리기 위해 힘쓰는 파타고니아입니다.',
        title: '멘즈 피츠 로이 허라이즌즈 리스판서빌리-티',
        price: '69000',
      ),
      ProductModel(
        id: 4,
        brand: '리버드',
        description: '매년 버려지는 교복과 불용 교복 원단을 활용하여 지갑을 만들어보았어요.',
        title: '[교복 업사이클링] Card Wallets #4',
        price: '30000',
      ),
      ProductModel(
        id: 5,
        brand: '모노로우',
        description: 'MONOROW는 한지 가죽으로 모던하면서도 럭셔리한 가방을 제작합니다.',
        title: '[한지 가죽] LEAF BAG SHOULDER BLACK',
        price: '129000',
      ),
      ProductModel(
        id: 6,
        brand: '코프(COAP)',
        description: '살아 숨 쉬는 모든 것과의 상생을 도모하는 자연주의 패션 브랜드 COAP 입니다.',
        title: '캘리백 Cali bag',
        price: '129000',
      ),
      ProductModel(
        id: 7,
        brand: '코프(COAP)',
        description: '살아 숨 쉬는 모든 것과의 상생을 도모하는 자연주의 패션 브랜드 COAP 입니다.',
        title: '[한지 가죽] 코프백A',
        price: '129000',
      ),
      ProductModel(
        id: 8,
        brand: '헤리언',
        description: '뉴욕감성 컨템포러리 패션브랜드이며 지속가능한 친환경 소재를 개발하는데 힘쓰고 있습니다.',
        title: '[한지 가죽] HARRIAN 리펭구르 숄더백',
        price: '154000',
      ),
      ProductModel(
        id: 9,
        brand: '아디다스',
        description: '세상의 모든 스포츠를 포용하는 아디다스의 친환경 라인입니다.',
        title: '슈퍼스타 x PARLEY - 화이트:블랙 / GV7615',
        price: '129000',
      ),
      ProductModel(
        id: 10,
        brand: '베자',
        description:
            '브라질 북쪽 지방의 오가닉 코튼과 아마존에서 채취한 천연 고무를 사용하여 모든 제품을 브라질에서 생산합니다.',
        title: '노바 (836)',
        price: '148000',
      ),
    ];
    return allProducts;
  }
}
