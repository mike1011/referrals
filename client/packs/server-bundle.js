import ReactOnRails from 'react-on-rails';

// import HelloWorld from '../bundles/HelloWorld/components/HelloWorldServer';
import NavigationBar from '../bundles/referrals/components/NavigationBar/NavigationBar';
import HelloWorld from '../bundles/referrals/components/HelloWorld';


// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  NavigationBar,
  HelloWorld,
});
