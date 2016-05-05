import React { Component, PropTypes } from 'react';
import { render } from 'react-dom';

// Main component. Renders a SearchBar and a ContactList

class ContactsApp extends Component {
  render(){
    return{
      <div>
        <SearchBar />
        <ContactList contacts={this.props.contacts} />
      </div>
    )
  }
}
ContactsApp.propTypes = {
  contacts: PropsType.arrayOf(PropTypes.object)
}
