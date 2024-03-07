import 'package:flutter/material.dart';

import '../../../../../application/dtos/cat_info_dto.dart';

class DetailScreen extends StatelessWidget {
  const DetailScreen({
    required this.catInfo,
    super.key,
  });

  final CatInfoDto catInfo;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(catInfo.name),
      ),
      body: Column(
        children: [
          Image.network(
            catInfo.imageUrl,
            width: screenSize.width * 0.9,
            height: screenSize.height * 0.5,
          ),
          _DetailContent(catInfo: catInfo),
        ],
      ),
    );
  }
}

class _DetailContent extends StatelessWidget {
  const _DetailContent({
    required this.catInfo,
  });

  final CatInfoDto catInfo;

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          children: [
            SizedBox(
              height: screenSize.height * 0.3,
              child: Text(catInfo.description),
            ),
          ],
        ),
      ),
    );
  }
}
