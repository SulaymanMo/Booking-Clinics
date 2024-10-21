import 'package:booking_clinics/core/common/basic_appbar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import '../../data/models/favorite.dart';
import '../../data/services/remote/firebase_auth.dart';
import '../../data/services/remote/firebase_firestore.dart';
import 'widgets/fav_card.dart';

class FavoriteView extends StatefulWidget {
  const FavoriteView({super.key});

  @override
  State<FavoriteView> createState() => _FavoriteViewState();
}

class _FavoriteViewState extends State<FavoriteView> {
  List<Favorite> _favorites = [];
  bool _isLoading = true;
  String? _errorMessage;

  @override
  void initState() {
    super.initState();
    _fetchFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BasicAppBar(title: 'Favorite'),
      body: _isLoading
          ? const Center(child: CircularProgressIndicator())
          : _errorMessage != null
              ? Center(child: Text(_errorMessage!))
              : _favorites.isNotEmpty
                  ? ListView.separated(
                      padding:
                          EdgeInsets.symmetric(horizontal: 6.w, vertical: 2.h),
                      itemCount: _favorites.length,
                      separatorBuilder: (_, __) => SizedBox(height: 1.5.h),
                      itemBuilder: (_, index) => FavCard(
                        favorite: _favorites[index],
                        onRemove: (favorite) async =>
                            await _removeFavorite(favorite),
                      ),
                    )
                  : const Center(
                      child: Text('Start by adding some favorites.')),
    );
  }

  Future<void> _fetchFavorites() async {
    try {
      setState(() => _isLoading = true);
      final uid = await FirebaseAuthService().getUid();
      final favorites =
          await FirebaseFirestoreService().getFavoritesForPatient(uid!);

      setState(() {
        _favorites = favorites;
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to load favorites: $e';
        _isLoading = false;
      });
    }
  }

  Future<void> _removeFavorite(Favorite favorite) async {
    try {
      setState(() => _isLoading = true);

      final uid = await FirebaseAuthService().getUid();
      await FirebaseFirestoreService()
          .removeFavoriteFromPatient(uid!, favorite);

      setState(() {
        _favorites.remove(favorite);
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to remove favorite: $e';
        _isLoading = false;
      });
    }
  }
}
