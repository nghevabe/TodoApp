import 'package:flutter/material.dart';

class TabBarRound extends StatefulWidget {
  final List<Widget> tabs;
  final List<Widget> tabsView;
  final ValueChanged<int>? onChangeTab;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? paddingTabItem;
  final Decoration? indicator;
  final Color? backgroundColor;
  final Color? labelColor;
  final Color? unselectedLabelColor;
  final TextStyle? unselectedLabelStyle;
  final bool isScrollable;

  TabBarRound(
      {required this.tabs,
      required this.tabsView,
      this.onChangeTab,
      this.padding,
      this.paddingTabItem,
      this.indicator,
      this.backgroundColor,
      this.labelColor,
      this.unselectedLabelColor,
      this.unselectedLabelStyle,
      this.isScrollable = true});

  @override
  State<TabBarRound> createState() => _TabBarRoundState();
}

class _TabBarRoundState extends State<TabBarRound>
    with SingleTickerProviderStateMixin {
  final _tabIndexNotifier = ValueNotifier(0);
  late TabController _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: widget.tabs.length, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.tabs.length,
      child: Column(
        children: [
          Container(
            padding: widget.padding ?? const EdgeInsets.all(4),
            alignment: Alignment.topCenter,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color: widget.backgroundColor ?? Colors.white),
            child: TabBar(
              indicatorColor: Colors.transparent,
              controller: _tabController,
              physics: const NeverScrollableScrollPhysics(),
              labelColor: widget.labelColor ?? Colors.white,
              unselectedLabelColor:
                  widget.unselectedLabelColor ?? Colors.lightBlue,

              // unselectedLabelStyle: widget.unselectedLabelStyle ??
              //     styles.textField2(Colors.lightBlue),
              // labelPadding: widget.paddingTabItem ??
              //     const EdgeInsets.symmetric(horizontal: 11, vertical: 0),
              // labelStyle: styles.textField2(colors.PrimaryColor9),

              onTap: (index) {
                _tabIndexNotifier.value = index;
                widget.onChangeTab?.call(index);
              },
              indicator: widget.indicator ??
                  BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                  ),
              tabs: widget.tabs,
            ),
          ),
          widget.isScrollable
              ? Expanded(
                  child: TabBarView(
                      children: widget.tabsView,
                      physics: NeverScrollableScrollPhysics(),
                      controller: _tabController))
              : ValueListenableBuilder<int>(
                  valueListenable: _tabIndexNotifier,
                  builder: (context, index, child) => widget.tabsView[index])
        ],
      ),
    );
  }
}
