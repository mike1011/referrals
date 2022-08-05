// import ReactOnRails from 'react-on-rails';
// ..refer - > https://github.com/shakacode/react_on_rails/issues/991
window.ReactOnRails = window.ReactOnRails || require('react-on-rails').default;

import 'jquery';
import 'jquery-ujs';

// import HelloWorld from '../bundles/HelloWorld/components/HelloWorld';
import Alerts from '../bundles/common/components/Alerts/Alerts';
import NavigationBar from '../bundles/common/components/NavigationBar/NavigationBar';
import SignInPage from '../bundles/common/components/SignIn/SignIn';
import SignUpPage from '../bundles/common/components/SignUp/SignUp';
import NewInvitation from '../bundles/invitations/components/New';
import EditInvitation from '../bundles/invitations/components/Edit';
import ListInvitations from '../bundles/invitations/components/List';

// This is how react_on_rails can see the HelloWorld in the browser.
ReactOnRails.register({
  NavigationBar,
  Alerts,
  SignInPage,
  SignUpPage,
  EditInvitation, NewInvitation, ListInvitations
});
