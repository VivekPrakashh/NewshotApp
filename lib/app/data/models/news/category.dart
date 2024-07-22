import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:get/get.dart';
import 'package:news_shots_app/app/core/extenstions.dart';

part 'category.freezed.dart';
part 'category.g.dart';

@freezed
class Category with _$Category {
  const factory Category({
    // ignore: invalid_annotation_target
    @JsonKey(name: '_id') required String id,
    required String name,
    required String createdBy,
    required String createdAt,
    required String updatedAt,
    required String hindiName,
  }) = _Category;

  factory Category.fromJson(Map<String, dynamic> json) =>
      _$CategoryFromJson(json);
}

extension CategoryX on Category {
  String? get getShareSuggestionMessage {
    final isEnglish = Get.locale?.isEnglish() ?? true;
    switch (name) {
      case "National":
        return isEnglish
            ? "Major national development! Share this news with your family and friends to stay informed together."
            : "महत्वपूर्ण राष्ट्रीय खबर! इसे अपने परिवार और दोस्तों के साथ साझा करें और साथ में सूचित रहें।";
      case "Business":
        return isEnglish
            ? "Breakthrough in business! Let your friends and family know to keep them ahead in the corporate world."
            : "व्यापार में नई प्रगति! अपने दोस्तों और परिवार को बताएं ताकि वे कॉर्पोरेट दुनिया में आगे रहें।";
      case "Health":
        return isEnglish
            ? "Important health update! Share with loved ones for their health and safety."
            : "महत्वपूर्ण स्वास्थ्य अपडेट! इसे अपने प्रियजनों के साथ साझा करें उनके स्वास्थ्य और सुरक्षा के लिए।";
      case "Sports":
        return isEnglish
            ? "Big sports news! Share it for an energetic chat with friends and family."
            : "बड़ी खेल की खबर! दोस्तों और परिवार के साथ साझा करें और उत्साहित चर्चा का आनंद लें।";
      case "Lifestyle":
        return isEnglish
            ? "Fresh lifestyle insights! Share with your circle to inspire and engage."
            : "नई जीवनशैली की जानकारी! अपने चक्र के साथ साझा करें और प्रेरणा दें।";
      case "World News":
        return isEnglish
            ? "Global news alert! Share with family and friends for worldwide awareness."
            : "वैश्विक समाचार अलर्ट! परिवार और दोस्तों के साथ साझा करें और विश्वव्यापी जागरूकता बढ़ाएं।";
      case "Crime and Justice":
        return isEnglish
            ? "Crucial crime report! Share to keep your friends and family informed and alert."
            : "अपराध पर महत्वपूर्ण रिपोर्ट! अपने दोस्तों और परिवार को जागरूक और सूचित रखने के लिए साझा करें।";
      case "Entertainment":
        return isEnglish
            ? "Trending in entertainment! Share this buzz with friends and family for shared enjoyment."
            : "मनोरंजन में नया ट्रेंड! इस मजेदार खबर को दोस्तों और परिवार के साथ साझा करें।";
      case "Technology":
        return isEnglish
            ? "Revolutionary tech news! Share to keep everyone in the tech loop."
            : "क्रांतिकारी तकनीकी खबर! सभी को तकनीकी जगत में अपडेट रखने के लिए साझा करें।";
      default:
        return null;
    }
  }

  String get getCategoryName => Get.locale!.isEnglish() ? name : hindiName;
}
