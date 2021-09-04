import 'package:flutter/material.dart';
import 'package:wakelock/wakelock.dart';

/// Envolva em qualquer widget para fazer chamadas asincronas para mostrar o loading
/// enquanto a chamada asincrona estiver em andamento
///
/// Pode ser ligado e desligado alterando o valor boleando do atributo [isLoading]
///
/// O indicador de loading parão é [CircularProgressIndicator], porém ele pode
/// ser substituido por qualquer widget
///
/// A cor do plano de fundo pode ser modificada pelo atributo [color]
///
///
//UST: 10/08 - DgAnimatedLoading - id:21 - 9pts - Criação
class DgAnimatedLoading extends StatefulWidget {
  final bool isLoading;
  final double opacity;
  final Color color;
  final Widget progressIndicator;
  final Widget child;

  const DgAnimatedLoading({
    @required this.isLoading,
    @required this.child,
    this.opacity = 0.5,
    this.progressIndicator = const CircularProgressIndicator(),
    this.color,
  });

  @override
  _DgAnimatedLoadingState createState() => _DgAnimatedLoadingState();
}

class _DgAnimatedLoadingState extends State<DgAnimatedLoading>
    with SingleTickerProviderStateMixin {
  AnimationController _controller;
  Animation<double> _animation;
  bool _overlayVisible;

  _DgAnimatedLoadingState();

  @override
  void initState() {
    //impede sleep por inatividade - Depende do pacote wakelock
    Wakelock.enable();
    super.initState();
    _overlayVisible = false;
    _controller = AnimationController(
        vsync: this, duration: const Duration(milliseconds: 300));
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
    _animation.addStatusListener((status) {
      status == AnimationStatus.forward
          ? setState(() => {_overlayVisible = true})
          // ignore: unnecessary_statements
          : null;

      status == AnimationStatus.dismissed
          ? setState(() => {_overlayVisible = false})
          // ignore: unnecessary_statements
          : null;
    });
    if (widget.isLoading) {
      _controller.forward();
    }
  }

  @override
  void didUpdateWidget(DgAnimatedLoading oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!oldWidget.isLoading && widget.isLoading) {
      _controller.forward();
    }

    if (oldWidget.isLoading && !widget.isLoading) {
      _controller.reverse();
    }
  }

  @override
  void dispose() {
    //libera sleep por inatividade - Depende do pacote wakelock
    Wakelock.disable();
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final widgets = <Widget>[];
    widgets.add(widget.child);

    if (_overlayVisible == true) {
      final modal = FadeTransition(
        opacity: _animation,
        child: Stack(
          children: <Widget>[
            Opacity(
              opacity: widget.opacity,
              child: ModalBarrier(
                dismissible: false,
                color: widget.color ?? Theme.of(context).colorScheme.background,
              ),
            ),
            Center(child: widget.progressIndicator),
          ],
        ),
      );
      widgets.add(modal);
    }

    return Stack(children: widgets);
  }
}
