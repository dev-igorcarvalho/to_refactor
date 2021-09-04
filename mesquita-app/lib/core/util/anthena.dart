class Anthena<T> {
  bool _changed;
  T _mutableState;
  T _imutableState;
  Anthena<T> _emmiter;
  List<Anthena<T>> _anthenas;

  Anthena._() {
    _anthenas = [];
    _changed = false;
    _emmiter = this;
  }

  ///gera uma antena
  factory Anthena.instance() => Anthena._();

  ///se conecta com uma antena para receber dados
  void listenTo(Anthena<T> emmiter) {
    _emmiter = emmiter;
    _emmiter.addAnthena(this);
  }

  ///se desconecta da antena
  void stopListening() {
    _emmiter.removeAnthena(this);
    _emmiter = this;
  }

  ///devolve o dado recebido
  T get receivedData => _imutableState;

  ///adiciona antena na lista de ouvintes
  void addAnthena(Anthena<T> anthena) {
    if (frequency == anthena.frequency) {
      if (!_anthenas.contains(anthena)) _anthenas.add(anthena);
    }
  }

  ///remove antena da lista de ouvintes
  void removeAnthena(Anthena<T> anthena) {
    if (frequency == anthena.frequency) {
      _anthenas.remove(anthena);
    }
  }

  /// emite dados para todos os ouvintes
  void emmit() {
    if (_changed) {
      _imutableState = _mutableState;
      // ignore: avoid_function_literals_in_foreach_calls
      _anthenas.forEach((e) {
        if (e.frequency == frequency) e.recieve();
      });
      _changed = false;
    }
  }

  ///recebe dados da emissora
  void recieve() {
    _imutableState = _emmiter.receivedData;
    _changed = true;
  }

  ///muda o estado mutavel
  set state(T state) {
    _mutableState = state;
  }

  /// marca mudança de estado para ser enviado
  void setChange() {
    _changed = true;
  }

  int get frequency => _emmiter.hashCode;

  void display() {
    // ignore: avoid_print
    print(_imutableState);
  }
}
