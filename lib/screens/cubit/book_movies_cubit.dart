import 'package:bloc/bloc.dart';
import 'package:booking_ticket/class_details/class_details.dart';
import 'package:meta/meta.dart';

part 'book_movies_state.dart';

class BookMoviesCubit extends Cubit<BookMoviesState> {
  BookMoviesCubit() : super(BookMoviesInitial());
  List<Details> bookMovies = [];
  int counter = 0;
  void bookMovie(Details details) {
    bookMovies.add(details);
    emit(BookMoviesSuccess());
    counter++;
  }
}
